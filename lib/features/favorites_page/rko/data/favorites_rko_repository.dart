import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/utils/favorites/rko/favorites_rko_data.dart';
import 'package:podberi_ru/features/favorites_page/rko/presentation/favorites_rko_controller.dart';

import 'favorites_rko_data_source.dart';

abstract class FavoritesRkoRepositoryImpl {
  Future<void> fetch(String arg, List<FavoritesRkoData> isarData,
      AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesRkoRepository
    implements FavoritesRkoRepositoryImpl {
  FavoritesRkoRepository();

  @override
  Future<RkoModel> fetch(
      String url,
      List<FavoritesRkoData> isarData,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    if (url == 'rko') {
      List<ListRkoModel> list = [];
      return RkoModel(itemsCount: 0, items: list);
    } else {
      final response = await GetIt.I<FavoritesRkoGetDataSource>().fetch(
        url,
      );
      if (response.itemsCount <= 10) {

        ref
            .watch(favoritesRkoListStateProvider.notifier)
            .state
            .addAll(response.items);
      }
      ref.keepAlive();
      return response;
    }
  }
}

///репозиторий для получения рко к которые находятся в избранном
/// здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [favoritesRkoListControllerProvider]
final favoritesRkoRepositoryProvider =
    Provider.autoDispose<FavoritesRkoRepository>((ref) {
  final fetch = FavoritesRkoRepository();
  return fetch;
});
