import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:podberi_ru/features/comparison_page/zaimy/presentation/comparison_zaimy_controller.dart';

import 'comparison_zaimy_data_source.dart';

abstract class ComparisonZaimyRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonZaimyRepository implements ComparisonZaimyRepositoryImpl {
  ComparisonZaimyRepository();

  @override
  Future<ZaimyModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///если передали квери только из одного типа продукта
    ///(т.е без списка id которые добавлены в сравнение - это на случай если в сравнении пусто)
    if (arg == 'zaimy') {
      List<ListZaimyModel> list = [];
      ref.watch(comparisonZaimyListLengthStateController.notifier).state = 0;
      ///то возвращаем пустой список чтобы отобразить что продуктов в сравнении нет
      return ZaimyModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonZaimyGetDataSource>().fetch(arg);
      ref.watch(comparisonZaimyListLengthStateController.notifier).state = response.itemsCount;
      ///если всего один продукт в сравнении
      if (response.itemsCount == 1) {

        ///то у всех провайдеров для второго page view оставляем пустые значения
        ///а для первого заполняем данными
        ref.watch(comparisonSecondZaimyBankNameStateController.notifier).state =
            '';
        ref.watch(comparisonFirstZaimyBankNameStateProvider.notifier).state =
            response.items[0].name;
      } else {
        ///если в респонсе больше одного продукта
        ///то все провайдеры для каждого pfge view заполняем данными
        ref.watch(comparisonFirstZaimyBankNameStateProvider.notifier).state =
            response.items[0].name;
        ref.watch(comparisonSecondZaimyBankNameStateController.notifier).state =
            response.items[0].name;
      }
      return response;
    }
  }
}

///репозиторий для получения займов в сравнении
///вызывается из [comparisonZaimyListControllerProvider]
final comparisonZaimyRepositoryProvider =
    Provider.autoDispose<ComparisonZaimyRepository>((ref) {
  final fetch = ComparisonZaimyRepository();
  return fetch;
});
