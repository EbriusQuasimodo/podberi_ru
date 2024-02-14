import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/features/comparison_page/debit_cards/presentation/comparison_debit_cards_controller.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';

import 'comparison_rko_data_source.dart';

abstract class ComparisonRkoRepositoryImpl {
  Future<void> fetch(String arg, int firstPageNum, int secondPageNum,AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonRkoRepository
    implements ComparisonRkoRepositoryImpl {
  ComparisonRkoRepository();

  @override
  Future<RkoModel> fetch(
      String arg,int firstPageNum, int secondPageNum, AutoDisposeAsyncNotifierProviderRef ref) async {

    ///если передали квери только из одного типа продукта
    ///(т.е без списка id которые добавлены в сравнение - это на случай если в сравнении пусто)
    if (arg == 'rko') {
      List<ListRkoModel> list = [];
      ref.watch(comparisonRkoListLengthStateController.notifier).state = 0;
      ///то возвращаем пустой список чтобы отобразить что продуктов в сравнении нет
      return RkoModel(items: list, itemsCount: 0);
    } else {
      final response =
          await GetIt.I<ComparisonRkoGetDataSource>().fetch(arg);
      ref.watch(comparisonRkoListLengthStateController.notifier).state = response.itemsCount;
      ///если всего один продукт в сравнении
      if (response.itemsCount == 1) {

        ///то у всех провайдеров для второго page view оставляем пустые значения
        ///а для первого заполняем данными
        ref.watch(comparisonSecondRkoBankNameStateProvider.notifier).state =
            '';
        ref.watch(comparisonFirstRkoBankNameStateProvider.notifier).state =
            response.items[firstPageNum].bankDetails!.bankName;

        ref
            .watch(comparisonSecondRkoProductNameStateProvider.notifier)
            .state = '';
        ref.watch(comparisonFirstRkoProductNameStateProvider.notifier).state =
            response.items[firstPageNum].ratesName;
      } else {
        ///если в респонсе больше одного продукта
        ///то все провайдеры для каждого pfge view заполняем данными
        ref.watch(comparisonFirstRkoBankNameStateProvider.notifier).state =
            response.items[firstPageNum].bankDetails!.bankName;
        ref.watch(comparisonSecondRkoBankNameStateProvider.notifier).state =
            response.items[secondPageNum].bankDetails!.bankName;

        ref.watch(comparisonFirstRkoProductNameStateProvider.notifier).state =
            response.items[firstPageNum].ratesName;
        ref
            .watch(comparisonSecondRkoProductNameStateProvider.notifier)
            .state = response.items[secondPageNum].ratesName;
      }

      return response;
    }
  }
}

///репозиторий для получения дебетовок в сравнении
///вызывается из [comparisonRkoListControllerProvider]
final comparisonRkoRepositoryProvider =
    Provider.autoDispose<ComparisonRkoRepository>((ref) {
  final fetch = ComparisonRkoRepository();
  return fetch;
});
