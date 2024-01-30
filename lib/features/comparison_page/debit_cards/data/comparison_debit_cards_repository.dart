import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';

import 'comparison_debit_cards_data_source.dart';

abstract class ComparisonDebitCardsRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonDebitCardsRepository
    implements ComparisonDebitCardsRepositoryImpl {
  ComparisonDebitCardsRepository();

  @override
  Future<DebitCardsModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///если передали квери только из одного типа продукта
    ///(т.е без списка id которые добавлены в сравнение - это на случай если в сравнении пусто)
    if (arg == 'debit_cards') {
      List<ListDebitCardsModel> list = [];

      ///то возвращаем пустой список чтобы отобразить что продуктов в сравнении нет
      return DebitCardsModel(items: list, itemsCount: 0);
    } else {
      final response =
          await GetIt.I<ComparisonDebitCardsGetDataSource>().fetch(arg);

      ///если всего один продукт в сравнении
      if (response.itemsCount == 1) {
        ///то у всех провайдеров для второго page view оставляем пустые значения
        ///а для первого заполняем данными
        ref.watch(comparisonSecondDebitBankNameStateController.notifier).state =
            '';
        ref.watch(comparisonFirstDebitBankNameStateProvider.notifier).state =
            response.items[0].bankDetails!.bankName;

        ref
            .watch(comparisonSecondDebitProductNameStateController.notifier)
            .state = '';
        ref.watch(comparisonFirstDebitProductNameStateProvider.notifier).state =
            response.items[0].name;
      } else {
        ///если в респонсе больше одного продукта
        ///то все провайдеры для каждого pfge view заполняем данными
        ref.watch(comparisonFirstDebitBankNameStateProvider.notifier).state =
            response.items[0].bankDetails!.bankName;
        ref.watch(comparisonSecondDebitBankNameStateController.notifier).state =
            response.items[0].bankDetails!.bankName;

        ref.watch(comparisonFirstDebitProductNameStateProvider.notifier).state =
            response.items[0].name;
        ref
            .watch(comparisonSecondDebitProductNameStateController.notifier)
            .state = response.items[0].name;
      }
      return response;
    }
  }
}

///репозиторий для получения дебетовок в сравнении
///вызывается из [comparisonDebitCardsListControllerProvider]
final comparisonDebitCardsRepositoryProvider =
    Provider.autoDispose<ComparisonDebitCardsRepository>((ref) {
  final fetch = ComparisonDebitCardsRepository();
  return fetch;
});
