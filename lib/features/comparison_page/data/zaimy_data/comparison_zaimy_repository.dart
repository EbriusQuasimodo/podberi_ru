import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';

import 'comparison_zaimy_data_source.dart';

abstract class ComparisonZaimyRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonZaimyRepository implements ComparisonZaimyRepositoryImpl {
  ComparisonZaimyRepository();

  @override
  Future<ZaimyModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    if (arg == 'debit_cards?' ||
        arg == 'credit_cards?' ||
        arg == 'zaimy?' ||
        arg == 'rko?') {
      List<ListZaimyModel> list = [];
      return ZaimyModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonZaimyGetDataSource>().fetch(arg);
      if (response.items.length == 1) {
        ref
            .watch(comparisonSecondProductDescriptionStateController.notifier)
            .state = '';
        ref
            .watch(comparisonFirstProductDescriptionStateProvider.notifier)
            .state = response.items[0].name;
      } else {
        ref
            .watch(comparisonFirstProductDescriptionStateProvider.notifier)
            .state = response.items[0].name;
        ref
            .watch(comparisonSecondProductDescriptionStateController.notifier)
            .state = response.items[0].name;
      }
      return response;
    }
  }
}

///репозиторий для получения всех продуктов в сравнении здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [comparisonZaimyListControllerProvider]
final comparisonZaimyRepositoryProvider =
    Provider.autoDispose<ComparisonZaimyRepository>((ref) {
  final fetch = ComparisonZaimyRepository();
  return fetch;
});
