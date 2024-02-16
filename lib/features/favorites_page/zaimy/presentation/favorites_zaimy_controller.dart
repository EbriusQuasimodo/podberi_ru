import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/features/favorites_page/shared_domain/isar_pagination_params.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/data/favorites_zaimy_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final favoritesZaimyListStateProvider =
    StateProvider.autoDispose<List<ListZaimyModel>>((ref) {
  return [];
});

///контроллер списка микрозаймов в избранном
class FavoritesZaimyListController extends AutoDisposeFamilyAsyncNotifier<
    ZaimyModel, IsarPaginationParamsModel> {
  FavoritesZaimyListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<ZaimyModel> build(IsarPaginationParamsModel arg) async {
    List<FavoritesZaimyData> productIdListZaimy = [];
    productTypeWithQuery = ref.read(favoritesProductUrlStateProvider);
    await isar?.txn(() async {
      if (arg.limit != -1 && arg.offset != -1) {
        productIdListZaimy = (await isar?.favoritesZaimyDatas
            .where(sort: Sort.desc)
            .anyIsarId()
            .offset(arg.offset * 10)
            .limit(arg.limit)
            .findAll())!;
      } else {
        productIdListZaimy = (await isar?.favoritesZaimyDatas
            .where(sort: Sort.desc)
            .anyIsarId()
            .findAll())!;
      }
    });
    productTypeWithQuery += '?';
    for (int i = 0; i < productIdListZaimy.length; i++) {
      productTypeWithQuery += '_id=${productIdListZaimy[i].id}&';
    }
    productTypeWithQuery =
        productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);

    final favoritesZaimyRepo = ref.read(favoritesZaimyRepositoryProvider);
    ref.keepAlive();
    return await favoritesZaimyRepo.fetch(productTypeWithQuery, productIdListZaimy,ref);
  }
}

///контроллер для получения микрозаймов в избранном
final favoritesZaimyListControllerProvider =
    AutoDisposeAsyncNotifierProvider.family<FavoritesZaimyListController,
        ZaimyModel, IsarPaginationParamsModel>(
  FavoritesZaimyListController.new,
);
