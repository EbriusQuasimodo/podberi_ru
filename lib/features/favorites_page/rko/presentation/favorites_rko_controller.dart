import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/features/favorites_page/rko/data/favorites_rko_repository.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final favoritesRkoListStateProvider = StateProvider.autoDispose<List<ListRkoModel>>((ref) {
  return [];
});

///контроллер списка рко в  избранном
class FavoritesRkoListController extends AutoDisposeFamilyAsyncNotifier<
    RkoModel, IsarPaginationParamsModel> {
  FavoritesRkoListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<RkoModel> build(IsarPaginationParamsModel arg) async {
    List<FavoritesRkoData> productIdListRko =[];
    productTypeWithQuery = ref.read(favoritesProductUrlStateProvider);

    await isar?.txn(() async {
      if (arg.limit != -1 && arg.offset != -1) {
        productIdListRko = (await isar?.favoritesRkoDatas
            .where(sort: Sort.desc).anyIsarId()
            .offset(arg.offset*10)
            .limit(arg.limit)
            .findAll())!;
      } else {
        productIdListRko =
            (await isar?.favoritesRkoDatas.where(sort: Sort.desc).anyIsarId().findAll())!;
      }
    });

    productTypeWithQuery += '?';
    for (int i = 0; i < productIdListRko.length; i++) {

      productTypeWithQuery += '_id=${productIdListRko[i].id}&';
    }

    productTypeWithQuery =
        productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);

    final favoritesRkoRepo =
        ref.read(favoritesRkoRepositoryProvider);
    ref.keepAlive();
    return await favoritesRkoRepo.fetch(
        productTypeWithQuery,productIdListRko, ref);
  }
}

///контроллер для получения всех рко в избранном
final favoritesRkoListControllerProvider =
    AutoDisposeAsyncNotifierProvider.family<FavoritesRkoListController,
        RkoModel, IsarPaginationParamsModel>(
  FavoritesRkoListController.new,
);
