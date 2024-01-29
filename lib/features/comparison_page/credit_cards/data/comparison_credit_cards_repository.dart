import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
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
    if (
        arg == 'credit_cards' ) {
      List<ListCreditCardsModel> list = [];
      return CreditCardsModel(items: list, itemsCount: 0);
    } else {
      final response = await GetIt.I<ComparisonCreditCardsGetDataSource>().fetch(arg);
      if (response.items.length == 1) {
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

///репозиторий для получения кредиток в сравнении здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [comparisonCreditCardsListControllerProvider]
final comparisonCreditCardsRepositoryProvider =
    Provider.autoDispose<ComparisonCreditCardsRepository>((ref) {
  final fetch = ComparisonCreditCardsRepository();
  return fetch;
});
