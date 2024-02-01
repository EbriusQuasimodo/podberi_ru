import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/favorites_page/shared_presentation/favorites_controller.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/data/favorites_zaimy_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

///контроллер списка микрозаймов в избранном
class FavoritesZaimyListController extends AutoDisposeAsyncNotifier<
    ZaimyModel> {
  FavoritesZaimyListController();

  String productTypeWithQuery = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<ZaimyModel> build() async {
    List<FavoritesZaimyData> productIdListZaimy = [];
    productTypeWithQuery = ref.read(favoritesProductUrlStateProvider);
        await isar?.txn(() async {
          productIdListZaimy =
          (await isar?.favoritesZaimyDatas.where().findAll())!;
        });
        productTypeWithQuery += '?';
        for (int i = 0; i < productIdListZaimy.length; i++) {
          productTypeWithQuery += '_id=${productIdListZaimy[i].id}&';
        }
    productTypeWithQuery = productTypeWithQuery.substring(0, productTypeWithQuery.length - 1);


    final favoritesZaimyRepo = ref.read(favoritesZaimyRepositoryProvider);

    return await favoritesZaimyRepo.fetch(productTypeWithQuery, ref);
  }
}

///контроллер для получения микрозаймов в избранном
final favoritesZaimyListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesZaimyListController,ZaimyModel>(
  FavoritesZaimyListController.new,
);
