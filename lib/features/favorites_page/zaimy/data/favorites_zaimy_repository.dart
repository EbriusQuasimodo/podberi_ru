import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/presentation/favorites_zaimy_controller.dart';

import 'favorites_zaimy_data_source.dart';


abstract class FavoritesZaimyRepositoryImpl {
  Future<void> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesZaimyRepository implements FavoritesZaimyRepositoryImpl {
  FavoritesZaimyRepository();

  @override
  Future<ZaimyModel> fetch(String arg,
      AutoDisposeAsyncNotifierProviderRef ref) async {

    if(arg == 'zaimy'){
      List<ListZaimyModel> list = [];
      return ZaimyModel(itemsCount: 0,items: list);
    }else{
      final response =
      await GetIt.I<FavoritesZaimyGetDataSource>().fetch(arg);
      if (response.itemsCount <= 10) {
        ref
            .watch(favoritesZaimyListStateProvider.notifier)
            .state
            .addAll(response.items);
      }
      ref.keepAlive();
      return response;
    }

  }
}

///репозиторий для получения всех займов которые находятся в избранном
/// здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [favoritesZaimyListControllerProvider]
final favoritesZaimyRepositoryProvider =
    Provider.autoDispose<FavoritesZaimyRepository>((ref) {
  final fetch = FavoritesZaimyRepository();
  return fetch;
});
