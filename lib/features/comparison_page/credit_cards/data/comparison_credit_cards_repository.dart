import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/presentation/comparison_credit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';

import 'comparison_credit_cards_data_source.dart';

abstract class ComparisonCreditCardsRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonCreditCardsRepository implements ComparisonCreditCardsRepositoryImpl {
  ComparisonCreditCardsRepository();

  @override
  Future<CreditCardsModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///если передали квери только из одного типа продукта
    ///(т.е без списка id которые добавлены в сравнение - это на случай если в сравнении пусто)
    if (arg == 'credit_cards') {
      List<ListCreditCardsModel> list = [];
      ref.watch(comparisonCreditListLengthStateController.notifier).state = 0;
      ///то возвращаем пустой список чтобы отобразить что продуктов в сравнении нет
      return CreditCardsModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonCreditCardsGetDataSource>().fetch(arg);
      ref.watch(comparisonCreditListLengthStateController.notifier).state = response.itemsCount;
      ///если всего один продукт в сравнении
      if (response.itemsCount == 1) {

        ///то у всех провайдеров для второго page view оставляем пустые значения
        ///а для первого заполняем данными
        ref
            .watch(comparisonSecondCreditBankNameStateController.notifier)
            .state = '';
        ref
            .watch(comparisonFirstCreditBankNameStateProvider.notifier)
            .state = response.items[0].bankDetails!.bankName;

        ref
            .watch(comparisonSecondCreditProductNameStateController.notifier)
            .state = '';
        ref
            .watch(comparisonFirstCreditProductNameStateProvider.notifier)
            .state = response.items[0].name;
      } else {
        ///если в респонсе больше одного продукта
        ///то все провайдеры для каждого pfge view заполняем данными
        ref
            .watch(comparisonFirstCreditBankNameStateProvider.notifier)
            .state = response.items[0].bankDetails!.bankName;
        ref
            .watch(comparisonSecondCreditBankNameStateController.notifier)
            .state = response.items[0].bankDetails!.bankName;

        ref
            .watch(comparisonFirstCreditProductNameStateProvider.notifier)
            .state = response.items[0].name;
        ref
            .watch(comparisonSecondCreditProductNameStateController.notifier)
            .state = response.items[0].name;
      }
      return response;
    }
  }
}

///репозиторий для получения кредиток в сравнении
///вызывается из [comparisonCreditCardsListControllerProvider]
final comparisonCreditCardsRepositoryProvider =
    Provider.autoDispose<ComparisonCreditCardsRepository>((ref) {
  final fetch = ComparisonCreditCardsRepository();
  return fetch;
});
