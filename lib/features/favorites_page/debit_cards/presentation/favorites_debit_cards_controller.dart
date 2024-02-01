import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/data/favorites_debit_cards_repository.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

///контроллер списка дебетовок в  избранном
class FavoritesDebitCardsListController extends AutoDisposeAsyncNotifier<
    DebitCardsModel> {
  FavoritesDebitCardsListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<DebitCardsModel> build() async {
    List<FavoritesDebitCardsData> productIdListDebitCards = [];
    productTypeWithQuery = ref.read(favoritesProductUrlStateProvider);

        await isar?.txn(() async {
          productIdListDebitCards =
              (await isar?.favoritesDebitCardsDatas.where().findAll())!;
        });
        productTypeWithQuery += '?';
        for (int i = 0; i < productIdListDebitCards.length; i++) {
          productTypeWithQuery += '_id=${productIdListDebitCards[i].id}&';
        }
    productTypeWithQuery = productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);


    final favoritesDebitCardsRepo = ref.read(favoritesDebitCardsRepositoryProvider);

    return await favoritesDebitCardsRepo.fetch(productTypeWithQuery, ref);
  }
}

///контроллер для получения всех дебетовок в избранном
final favoritesDebitCardsListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesDebitCardsListController,DebitCardsModel>(
  FavoritesDebitCardsListController.new,
);
