import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/data/credit_cards/favorites_credit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'favorites_debit_cards_controller.dart';

///контроллер списка кредиток в избранном
class FavoritesCreditCardsListController extends AutoDisposeAsyncNotifier<
    CreditCardsModel> {
  FavoritesCreditCardsListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<CreditCardsModel> build() async {
    List<FavoritesCreditCardsData> productIdListCreditCards = [];
    productTypeUrl = ref.watch(filterProductUrlStateProvider);

        await isar?.txn(() async {
          productIdListCreditCards =
          (await isar?.favoritesCreditCardsDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListCreditCards.length; i++) {
          productTypeUrl += '_id=${productIdListCreditCards[i].id}&';
        }


    final favoritesRepo = ref.read(favoritesCreditCardsRepositoryProvider);

    return await favoritesRepo.fetch(productTypeUrl, ref);
  }
}

///контроллер для получения избранных кредитных карт
final favoritesCreditCardsListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesCreditCardsListController,CreditCardsModel>(
  FavoritesCreditCardsListController.new,
);
