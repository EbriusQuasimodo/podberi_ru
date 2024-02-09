import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/data/favorites_debit_cards_repository.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
final offsetStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final itemsCountFavoritesStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

///контроллер списка дебетовок в  избранном
class FavoritesDebitCardsListController extends AutoDisposeFamilyAsyncNotifier<
    DebitCardsModel, IsarPaginationParamsModel> {
  FavoritesDebitCardsListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<DebitCardsModel> build(IsarPaginationParamsModel arg) async {
    List<FavoritesDebitCardsData> productIdListDebitCards = [];
    productTypeWithQuery = ref.read(favoritesProductUrlStateProvider);

    print("arg.offset ${arg.offset}");
    await isar?.txn(() async {
      if (arg.limit != -1 && arg.offset != -1) {
        productIdListDebitCards = (await isar?.favoritesDebitCardsDatas
            .where()
            .offset(arg.offset*10)
            .limit(arg.limit)
            .findAll())!;
      } else {
        productIdListDebitCards =
            (await isar?.favoritesDebitCardsDatas.where().findAll())!;
      }
    });
    productTypeWithQuery += '?';
    for (int i = 0; i < productIdListDebitCards.length; i++) {
      productTypeWithQuery += '_id=${productIdListDebitCards[i].id}&';
    }

    productTypeWithQuery =
        productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);

    final favoritesDebitCardsRepo =
        ref.read(favoritesDebitCardsRepositoryProvider);
    ref.keepAlive();
    return await favoritesDebitCardsRepo.fetch(
        productTypeWithQuery, ref);
  }
}

///контроллер для получения всех дебетовок в избранном
final favoritesDebitCardsListControllerProvider =
    AutoDisposeAsyncNotifierProvider.family<FavoritesDebitCardsListController,
        DebitCardsModel, IsarPaginationParamsModel>(
  FavoritesDebitCardsListController.new,
);
