import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/favorites_page/presentation/favorites_page_controller.dart';

import 'favorites_data_source.dart';

abstract class FavoritesRepositoryImpl {
  Future<void> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesRepository implements FavoritesRepositoryImpl {
  FavoritesRepository();

  @override
  Future<List<ListProductModel>> fetch(String arg,
      AutoDisposeAsyncNotifierProviderRef ref) async {

    if(arg == 'debit_cards?' ||arg == 'credit_cards?'||arg == 'zaimy?'||arg == 'rko?'){
      List<ListProductModel> list = [];
      return list;
    }else{
      final response =
      await GetIt.I<FavoritesGetDataSource>().fetch(arg);
      return response;
    }

  }
}

///репозиторий для получения всех банковских продуктов здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [favoritesListControllerProvider]
final favoritesRepositoryProvider =
    Provider.autoDispose<FavoritesRepository>((ref) {
  final fetch = FavoritesRepository();
  return fetch;
});
