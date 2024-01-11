import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/favorites_page/data/zaimy/favorites_zaimy_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_controller.dart';

///контроллер списка микрозаймов в избранном
class FavoritesZaimyListController extends AutoDisposeAsyncNotifier<
    ZaimyModel> {
  FavoritesZaimyListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<ZaimyModel> build() async {
    List<FavoritesZaimyData> productIdListZaimy = [];
    productTypeUrl = ref.watch(favoritesProductUrlStateProvider);
print (productIdListZaimy);
        await isar?.txn(() async {
          productIdListZaimy =
          (await isar?.favoritesZaimyDatas.where().findAll())!;
        });
        productTypeUrl += '?';
        for (int i = 0; i < productIdListZaimy.length; i++) {
          productTypeUrl += '_id=${productIdListZaimy[i].id}&';
        }



    final favoritesRepo = ref.read(favoritesZaimyRepositoryProvider);

    return await favoritesRepo.fetch(productTypeUrl, ref);
  }
}

///контроллер для получения микрозаймов в избранном
final favoritesZaimyListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesZaimyListController,ZaimyModel>(
  FavoritesZaimyListController.new,
);
