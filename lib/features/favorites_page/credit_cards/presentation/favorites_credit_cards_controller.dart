import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/data/favorites_credit_cards_repository.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final favoritesCreditCardsListStateProvider =
    StateProvider.autoDispose<List<ListCreditCardsModel>>((ref) {
  return [];
});

///контроллер списка кредиток в избранном
class FavoritesCreditCardsListController extends AutoDisposeFamilyAsyncNotifier<
    CreditCardsModel, IsarPaginationParamsModel> {
  FavoritesCreditCardsListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<CreditCardsModel> build(IsarPaginationParamsModel arg) async {
    List<FavoritesCreditCardsData> productIdListCreditCards = [];
    productTypeWithQuery = ref.read(favoritesProductUrlStateProvider);

    await isar?.txn(() async {
      if (arg.limit != -1 && arg.offset != -1) {
        productIdListCreditCards = (await isar?.favoritesCreditCardsDatas
            .where(sort: Sort.desc)
            .anyIsarId()
            .offset(arg.offset * 10)
            .limit(arg.limit)
            .findAll())!;
      } else {
        productIdListCreditCards = (await isar?.favoritesCreditCardsDatas
            .where(sort: Sort.desc)
            .anyIsarId()
            .findAll())!;
      }
    });
    productTypeWithQuery += '?';
    for (int i = 0; i < productIdListCreditCards.length; i++) {
      productTypeWithQuery += '_id=${productIdListCreditCards[i].id}&';
    }
    productTypeWithQuery =
        productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);

    final favoritesCreditCardsRepo =
        ref.read(favoritesCreditCardsRepositoryProvider);
    ref.keepAlive();
    return await favoritesCreditCardsRepo.fetch(productTypeWithQuery, ref);
  }
}

///контроллер для получения избранных кредитных карт
final favoritesCreditCardsListControllerProvider =
    AutoDisposeAsyncNotifierProvider.family<FavoritesCreditCardsListController,
        CreditCardsModel, IsarPaginationParamsModel>(
  FavoritesCreditCardsListController.new,
);
