import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_controller.dart';

import 'favorites_debit_cards_data_source.dart';

abstract class FavoritesDebitCardsRepositoryImpl {
  Future<void> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesDebitCardsRepository implements FavoritesDebitCardsRepositoryImpl {
  FavoritesDebitCardsRepository();

  @override
  Future<DebitCardsModel> fetch(String url,
      AutoDisposeAsyncNotifierProviderRef ref) async {

    if(url == 'debit_cards'){
      List<ListDebitCardsModel> list = [];
      return DebitCardsModel(itemsCount: 0,items: list);
    }else{
      final response =
      await GetIt.I<FavoritesDebitCardsGetDataSource>().fetch(url,);
      ref.keepAlive();
      return response;
    }

  }
}

///репозиторий для получения дебетовок которые находятся в избранном
/// здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [favoritesDebitCardsListControllerProvider]
final favoritesDebitCardsRepositoryProvider =
    Provider.autoDispose<FavoritesDebitCardsRepository>((ref) {
  final fetch = FavoritesDebitCardsRepository();
  return fetch;
});
