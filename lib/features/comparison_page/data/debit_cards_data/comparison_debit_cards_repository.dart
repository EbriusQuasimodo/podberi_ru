import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';

import 'comparison_debit_cards_data_source.dart';

abstract class ComparisonDebitCardsRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonDebitCardsRepository implements ComparisonDebitCardsRepositoryImpl {
  ComparisonDebitCardsRepository();

  @override
  Future<DebitCardsModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    if (arg == 'debit_cards?' ||
        arg == 'credit_cards?' ||
        arg == 'zaimy?' ||
        arg == 'rko?') {
      List<ListDebitCardsModel> list = [];
      return DebitCardsModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonDebitCardsGetDataSource>().fetch(arg);
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
///вызывается из [comparisonDebitCardsListControllerProvider]
final comparisonDebitCardsRepositoryProvider =
    Provider.autoDispose<ComparisonDebitCardsRepository>((ref) {
  final fetch = ComparisonDebitCardsRepository();
  return fetch;
});
