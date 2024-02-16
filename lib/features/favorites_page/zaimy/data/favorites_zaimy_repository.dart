import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/core/utils/favorites/zaimy/favorites_zaimy_data.dart';
import 'package:podberi_ru/features/favorites_page/zaimy/presentation/favorites_zaimy_controller.dart';

import 'favorites_zaimy_data_source.dart';


abstract class FavoritesZaimyRepositoryImpl {
  Future<void> fetch(
      String arg, List<FavoritesZaimyData> isarData,AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesZaimyRepository implements FavoritesZaimyRepositoryImpl {
  FavoritesZaimyRepository();

  @override
  Future<ZaimyModel> fetch(String arg,List<FavoritesZaimyData> isarData,
      AutoDisposeAsyncNotifierProviderRef ref) async {

    if(arg == 'zaimy'){
      List<ListZaimyModel> list = [];
      return ZaimyModel(itemsCount: 0,items: list);
    }else{
      final response =
      await GetIt.I<FavoritesZaimyGetDataSource>().fetch(arg);
      if (response.itemsCount <= 10) {
        ///создаем список с айдишниками из изара - по нему будем сортироваться
        List<String> idListFromIsar = [];
        for (int i = 0; i < isarData.length; i++) {
          idListFromIsar.add(isarData[i].id!);
        }
        ///сортируем респонс по idListFromIsar
        final List<ListZaimyModel> sortedResponse =
        List.from(response.items)
          ..sort((a, b) => idListFromIsar.indexOf(a.id) - idListFromIsar.indexOf(b.id));

        ref
            .watch(favoritesZaimyListStateProvider.notifier)
            .state
            .addAll(sortedResponse);
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
