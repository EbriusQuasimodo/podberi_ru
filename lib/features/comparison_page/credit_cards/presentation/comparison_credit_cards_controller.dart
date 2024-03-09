import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/features/comparison_page/credit_cards/data/comparison_credit_cards_repository.dart';
import 'package:podberi_ru/features/comparison_page/shared_presentation/comparison_page_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ComparisonCreditCardsListController
    extends AutoDisposeAsyncNotifier<CreditCardsModel> {
  ComparisonCreditCardsListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<CreditCardsModel> build() async {
    int firstPageNum = ref.read(comparisonFirstDebitPageNumStateProvider);
    int secondPageNum = ref.read(comparisonSecondCreditPageNumStateProvider);
    ref.listen(comparisonFirstCreditPageNumStateProvider, (previous, next) {
      firstPageNum = next;
    });
    ref.listen(comparisonSecondCreditPageNumStateProvider, (previous, next) {
      secondPageNum = next;
    });
    List<ComparisonCreditCardsData> productIdListCreditCards = [];

    productTypeWithQuery = ref.read(comparisonProductUrlStateProvider);
    await isar?.txn(() async {
      productIdListCreditCards =
          (await isar?.comparisonCreditCardsDatas.where().findAll())!;
    });
    productTypeWithQuery += '?';
    for (int i = 0; i < productIdListCreditCards.length; i++) {
      productTypeWithQuery += '_id=${productIdListCreditCards[i].id}&';
    }
    productTypeWithQuery =
        productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);
    final comparisonCreditCardsRepo =
        ref.read(comparisonCreditCardsRepositoryProvider);

    return await comparisonCreditCardsRepo.fetch(
        productTypeWithQuery, firstPageNum, secondPageNum, ref);
  }
}

///контроллер для получения всех кредиток в сравнении
final comparisonCreditCardsListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ComparisonCreditCardsListController,
        CreditCardsModel>(
  ComparisonCreditCardsListController.new,
);
