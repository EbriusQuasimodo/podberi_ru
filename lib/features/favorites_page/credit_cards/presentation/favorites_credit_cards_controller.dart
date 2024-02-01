import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/data/favorites_credit_cards_repository.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


///контроллер списка кредиток в избранном
class FavoritesCreditCardsListController extends AutoDisposeAsyncNotifier<
    CreditCardsModel> {
  FavoritesCreditCardsListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<CreditCardsModel> build() async {
    List<FavoritesCreditCardsData> productIdListCreditCards = [];
    productTypeWithQuery = ref.read(favoritesProductUrlStateProvider);

        await isar?.txn(() async {
          productIdListCreditCards =
          (await isar?.favoritesCreditCardsDatas.where().findAll())!;
        });
        productTypeWithQuery += '?';
        for (int i = 0; i < productIdListCreditCards.length; i++) {
          productTypeWithQuery += '_id=${productIdListCreditCards[i].id}&';
        }
    productTypeWithQuery = productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);

    final favoritesCreditCardsRepo = ref.read(favoritesCreditCardsRepositoryProvider);

    return await favoritesCreditCardsRepo.fetch(productTypeWithQuery, ref);
  }
}

///контроллер для получения избранных кредитных карт
final favoritesCreditCardsListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesCreditCardsListController,CreditCardsModel>(
  FavoritesCreditCardsListController.new,
);
