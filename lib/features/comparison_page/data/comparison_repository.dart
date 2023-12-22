import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/comparison_page_controller.dart';

import 'comparison_data_source.dart';

abstract class ComparisonRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonRepository implements ComparisonRepositoryImpl {
  ComparisonRepository();

  @override
  Future<ProductModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    if (arg == 'debit_cards?' ||
        arg == 'credit_cards?' ||
        arg == 'zaimy?' ||
        arg == 'rko?') {
      List<ListProductModel> list = [];
      return ProductModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonGetDataSource>().fetch(arg);
      if (response.items.length == 1) {
        ref
            .watch(comparisonSecondProductDescriptionStateController.notifier)
            .state = '';
        ref
            .watch(comparisonFirstProductDescriptionStateProvider.notifier)
            .state = response.items[0].cardName;
      } else {
        ref
            .watch(comparisonFirstProductDescriptionStateProvider.notifier)
            .state = response.items[0].cardName;
        ref
            .watch(comparisonSecondProductDescriptionStateController.notifier)
            .state = response.items[0].cardName;
      }
      return response;
    }
  }
}

///репозиторий для получения всех продуктов в сравнении здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [comparisonListControllerProvider]
final comparisonRepositoryProvider =
    Provider.autoDispose<ComparisonRepository>((ref) {
  final fetch = ComparisonRepository();
  return fetch;
});
