import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/presentation/favorites_credit_cards_controller.dart';

import 'favorites_credit_cards_data_source.dart';


abstract class FavoritesCreditCardsRepositoryImpl {
  Future<void> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesCreditCardsRepository implements FavoritesCreditCardsRepositoryImpl {
  FavoritesCreditCardsRepository();

  @override
  Future<CreditCardsModel> fetch(String arg,
      AutoDisposeAsyncNotifierProviderRef ref) async {

    if(arg == 'credit_cards'){
      List<ListCreditCardsModel> list = [];
      return CreditCardsModel(itemsCount: 0,items: list);
    }else{
      final response =
      await GetIt.I<FavoritesCreditCardsGetDataSource>().fetch(arg);
      if (response.itemsCount <= 10) {
        ref
            .watch(favoritesCreditCardsListStateProvider.notifier)
            .state
            .addAll(response.items);
      }
      ref.keepAlive();
      return response;
    }

  }
}

///репозиторий для получения всех кредиток которые находятся в избранном
/// здесь формируется uri для запроса (productType),
///он наполняется типом продукта и id
///вызывается из [favoritesCreditCardsListControllerProvider]
final favoritesCreditCardsRepositoryProvider =
    Provider.autoDispose<FavoritesCreditCardsRepository>((ref) {
  final fetch = FavoritesCreditCardsRepository();
  return fetch;
});
