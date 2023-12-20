import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/utils/comparison/credit_cards/comparison_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/debit_cards/comparison_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/comparison/rko/comparison_rko_data.dart';
import 'package:podberi_ru/core/utils/comparison/zaimy/comparison_zaimy_data.dart';
import 'package:podberi_ru/features/comparison_page/data/comparison_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
final comparisonProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});

final comparisonFirstProductDescriptionStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondProductDescriptionStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});
///контроллер списка сравнения
class ComparisonListController extends AutoDisposeAsyncNotifier<
    List<ListProductModel>> {
  ComparisonListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<List<ListProductModel>> build() async {
    List<ComparisonDebitCardsData> productIdListDebitCards = [];
    List<ComparisonCreditCardsData> productIdListCreditCards = [];
    List<ComparisonZaimyData> productIdListZaimy = [];
    List<ComparisonRkoData> productIdListRko = [];
    productTypeUrl = ref.watch(comparisonProductUrlStateProvider);
    switch (productTypeUrl) {
      case 'debit_cards':
        await isar?.txn(() async {
          productIdListDebitCards =
          (await isar?.comparisonDebitCardsDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListDebitCards.length; i++) {
          productTypeUrl += '_id=${productIdListDebitCards[i].id}&';
        }
      case 'credit_cards':
        await isar?.txn(() async {
          productIdListCreditCards =
          (await isar?.comparisonCreditCardsDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListCreditCards.length; i++) {
          productTypeUrl += '_id=${productIdListCreditCards[i].id}&';
        }
      case 'zaimy':
        await isar?.txn(() async {
          productIdListZaimy =
          (await isar?.comparisonZaimyDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListZaimy.length; i++) {
          productTypeUrl += '_id=${productIdListZaimy[i].id}&';
        }
      case 'rko':
        await isar?.txn(() async {
          productIdListRko = (await isar?.comparisonRkoDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListRko.length; i++) {
          productTypeUrl += '_id=${productIdListRko[i].id}&';
        }
    }


    final comparisonRepo = ref.read(comparisonRepositoryProvider);

    return await comparisonRepo.fetch(productTypeUrl, ref);
  }
}

///контроллер для получения всех продуктов в сравнении
final comparisonListControllerProvider = AutoDisposeAsyncNotifierProvider<
    ComparisonListController, List<ListProductModel>>(
  ComparisonListController.new,
);
