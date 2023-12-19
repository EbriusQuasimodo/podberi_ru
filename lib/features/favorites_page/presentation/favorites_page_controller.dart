import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/features/favorites_page/data/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
final filterProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});
///контроллер списка избранного
class FavoritesListController extends AutoDisposeAsyncNotifier<
    List<ListProductModel>> {
  FavoritesListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<List<ListProductModel>> build() async {
    List<FavoritesDebitCardsData> productIdListDebitCards = [];
    List<FavoritesCreditCardsData> productIdListCreditCards = [];
    List<FavoritesZaimyData> productIdListZaimy = [];
    List<FavoritesRkoData> productIdListRko = [];
    productTypeUrl = ref.watch(filterProductUrlStateProvider);
    switch (productTypeUrl) {
      case 'debit_cards':
        await isar?.txn(() async {
          productIdListDebitCards =
              (await isar?.favoritesDebitCardsDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListDebitCards.length; i++) {
          productTypeUrl += '_id=${productIdListDebitCards[i].id}&';
        }
      case 'credit_cards':
        await isar?.txn(() async {
          productIdListCreditCards =
              (await isar?.favoritesCreditCardsDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListCreditCards.length; i++) {
          productTypeUrl += '_id=${productIdListCreditCards[i].id}&';
        }
      case 'zaimy':
        await isar?.txn(() async {
          productIdListZaimy =
              (await isar?.favoritesZaimyDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListZaimy.length; i++) {
          productTypeUrl += '_id=${productIdListZaimy[i].id}&';
        }
      case 'rko':
        await isar?.txn(() async {
          productIdListRko = (await isar?.favoritesRkoDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListRko.length; i++) {
          productTypeUrl += '_id=${productIdListRko[i].id}&';
        }
    }


    final eventRepo = ref.read(favoritesRepositoryProvider);

    return await eventRepo.fetch(productTypeUrl, ref);
  }
}

///кататалог для получения всех банковских продуктов здесь формируются фильтры
final favoritesListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesListController, List<ListProductModel>>(
  FavoritesListController.new,
);
