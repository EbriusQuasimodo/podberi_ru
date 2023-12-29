import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/data/debit_cards/favorites_debit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
final filterProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});
///контроллер списка избранного
class FavoritesDebitCardsListController extends AutoDisposeAsyncNotifier<
    DebitCardsModel> {
  FavoritesDebitCardsListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<DebitCardsModel> build() async {
    List<FavoritesDebitCardsData> productIdListDebitCards = [];
    productTypeUrl = ref.watch(filterProductUrlStateProvider);

        await isar?.txn(() async {
          productIdListDebitCards =
              (await isar?.favoritesDebitCardsDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListDebitCards.length; i++) {
          productTypeUrl += '_id=${productIdListDebitCards[i].id}&';
        }



    final favoritesRepo = ref.read(favoritesDebitCardsRepositoryProvider);

    return await favoritesRepo.fetch(productTypeUrl, ref);
  }
}

///контроллер для получения всех избранных продуктов
final favoritesDebitCardsListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesDebitCardsListController,DebitCardsModel>(
  FavoritesDebitCardsListController.new,
);
