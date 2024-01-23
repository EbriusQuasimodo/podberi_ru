import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/data/credit_cards_data/comparison_credit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'comparison_page_controller.dart';

///контроллер списка сравнения
class ComparisonCreditCardsListController extends AutoDisposeAsyncNotifier<
    CreditCardsModel> {
  ComparisonCreditCardsListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<CreditCardsModel> build() async {

    List<ComparisonCreditCardsData> productIdListCreditCards = [];

    productTypeUrl = ref.read(comparisonProductUrlStateProvider);
    await isar?.txn(() async {
      productIdListCreditCards =
      (await isar?.comparisonCreditCardsDatas.where().findAll())!;
    });
    productTypeUrl += '?';
    for (int i = 0; i < productIdListCreditCards.length; i++) {
      productTypeUrl += '_id=${productIdListCreditCards[i].id}&';
    }
    productTypeUrl = productTypeUrl.substring(0, productTypeUrl.length - 1);
    final comparisonRepo = ref.read(comparisonCreditCardsRepositoryProvider);

    return await comparisonRepo.fetch(productTypeUrl, ref);
  }
}

///контроллер для получения всех кредиток в сравнении
final comparisonCreditCardsListControllerProvider = AutoDisposeAsyncNotifierProvider<
    ComparisonCreditCardsListController, CreditCardsModel>(
  ComparisonCreditCardsListController.new,
);
