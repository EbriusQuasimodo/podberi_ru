import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/presentation/controllers/comparison_page_controller.dart';

import 'comparison_credit_cards_data_source.dart';

abstract class ComparisonCreditCardsRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ComparisonCreditCardsRepository implements ComparisonCreditCardsRepositoryImpl {
  ComparisonCreditCardsRepository();

  @override
  Future<CreditCardsModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    if (arg == 'debit_cards?' ||
        arg == 'credit_cards?' ||
        arg == 'zaimy?' ||
        arg == 'rko?') {
      List<ListCreditCardsModel> list = [];
      return CreditCardsModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonCreditCardsGetDataSource>().fetch(arg);
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
///вызывается из [comparisonCreditCardsListControllerProvider]
final comparisonCreditCardsRepositoryProvider =
    Provider.autoDispose<ComparisonCreditCardsRepository>((ref) {
  final fetch = ComparisonCreditCardsRepository();
  return fetch;
});
