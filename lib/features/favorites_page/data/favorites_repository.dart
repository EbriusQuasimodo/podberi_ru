import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_page_controller.dart';

import 'favorites_data_source.dart';

abstract class FavoritesRepositoryImpl {
  Future<void> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesRepository implements FavoritesRepositoryImpl {
  FavoritesRepository();

  @override
  Future<ProductModel> fetch(String arg,
      AutoDisposeAsyncNotifierProviderRef ref) async {

    if(arg == 'debit_cards?' ||arg == 'credit_cards?'||arg == 'zaimy?'||arg == 'rko?'){
      List<ListProductModel> list = [];
      return ProductModel(itemsCount: 0,items: list);
    }else{
      final response =
      await GetIt.I<FavoritesGetDataSource>().fetch(arg);
      return response;
    }

  }
}

///репозиторий для получения всех банковских продуктов которые находятся в избранном
/// здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [favoritesListControllerProvider]
final favoritesRepositoryProvider =
    Provider.autoDispose<FavoritesRepository>((ref) {
  final fetch = FavoritesRepository();
  return fetch;
});
