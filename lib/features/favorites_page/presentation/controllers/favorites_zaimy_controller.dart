import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/favorites_page/data/debit_cards/favorites_debit_cards_repository.dart';
import 'package:podberi_ru/features/favorites_page/data/zaimy/favorites_zaimy_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'favorites_debit_cards_controller.dart';

///контроллер списка избранного
class FavoritesZaimyListController extends AutoDisposeAsyncNotifier<
    ZaimyModel> {
  FavoritesZaimyListController();

  String productTypeUrl = '';
  final isar = Isar.getInstance();

  @override
  FutureOr<ZaimyModel> build() async {
    List<FavoritesZaimyData> productIdListZaimy = [];
    productTypeUrl = ref.watch(filterProductUrlStateProvider);

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

///контроллер для получения всех избранных продуктов
final favoritesZaimyListControllerProvider = AutoDisposeAsyncNotifierProvider<
    FavoritesZaimyListController,ZaimyModel>(
  FavoritesZaimyListController.new,
);