import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';

import 'comparison_zaimy_data_source.dart';

abstract class ComparisonZaimyRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonZaimyRepository implements ComparisonZaimyRepositoryImpl {
  ComparisonZaimyRepository();

  @override
  Future<ZaimyModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    if (arg == 'zaimy') {
      List<ListZaimyModel> list = [];
      return ZaimyModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonZaimyGetDataSource>().fetch(arg);
      if (response.items.length == 1) {
        ref
            .watch(comparisonSecondZaimyBankNameStateController.notifier)
            .state = '';
        ref
            .watch(comparisonFirstZaimyBankNameStateProvider.notifier)
            .state = response.items[0].name;
      } else {
        ref
            .watch(comparisonFirstZaimyBankNameStateProvider.notifier)
            .state = response.items[0].name;
        ref
            .watch(comparisonSecondZaimyBankNameStateController.notifier)
            .state = response.items[0].name;
      }
      return response;
    }
  }
}

///репозиторий для получения займов в сравнении здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [comparisonZaimyListControllerProvider]
final comparisonZaimyRepositoryProvider =
    Provider.autoDispose<ComparisonZaimyRepository>((ref) {
  final fetch = ComparisonZaimyRepository();
  return fetch;
});
