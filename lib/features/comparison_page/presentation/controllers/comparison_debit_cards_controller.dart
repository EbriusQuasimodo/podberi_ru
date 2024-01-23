import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/comparison_page/data/debit_cards_data/comparison_debit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'comparison_page_controller.dart';

///контроллер списка сравнения
class ComparisonDebitCardsListController
    extends AutoDisposeAsyncNotifier<DebitCardsModel> {
  ComparisonDebitCardsListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<DebitCardsModel> build() async {
    List<ComparisonDebitCardsData> productIdListDebitCards = [];
    productTypeUrl = ref.read(comparisonProductUrlStateProvider);
    await isar?.txn(() async {
      productIdListDebitCards =
          (await isar?.comparisonDebitCardsDatas.where().findAll())!;
    });
    productTypeUrl += '?';
    for (int i = 0; i < productIdListDebitCards.length; i++) {
      productTypeUrl += '_id=${productIdListDebitCards[i].id}&';
    }
    productTypeUrl = productTypeUrl.substring(0, productTypeUrl.length - 1);
    final comparisonRepo = ref.read(comparisonDebitCardsRepositoryProvider);

    return await comparisonRepo.fetch(productTypeUrl, ref);
  }
}

///контроллер для получения всех дебетовок в сравнении
final comparisonDebitCardsListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ComparisonDebitCardsListController,
        DebitCardsModel>(
  ComparisonDebitCardsListController.new,
);
