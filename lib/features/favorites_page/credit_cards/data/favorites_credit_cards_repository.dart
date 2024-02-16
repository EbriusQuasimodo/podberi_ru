import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/core/utils/favorites/credit_cards/favorites_credit_cards_data.dart';
import 'package:podberi_ru/features/favorites_page/credit_cards/presentation/favorites_credit_cards_controller.dart';

import 'favorites_credit_cards_data_source.dart';


abstract class FavoritesCreditCardsRepositoryImpl {
  Future<void> fetch(
      String arg,
  List<FavoritesCreditCardsData> isarData,AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesCreditCardsRepository implements FavoritesCreditCardsRepositoryImpl {
  FavoritesCreditCardsRepository();

  @override
  Future<CreditCardsModel> fetch(String arg,
  List<FavoritesCreditCardsData> isarData,
      AutoDisposeAsyncNotifierProviderRef ref) async {

    if(arg == 'credit_cards'){
      List<ListCreditCardsModel> list = [];
      return CreditCardsModel(itemsCount: 0,items: list);
    }else{
      final response =
      await GetIt.I<FavoritesCreditCardsGetDataSource>().fetch(arg);
      if (response.itemsCount <= 10) {
        ///создаем список с айдишниками из изара - по нему будем сортироваться
        List<String> idListFromIsar = [];
        for (int i = 0; i < isarData.length; i++) {
          idListFromIsar.add(isarData[i].id!);
        }
        ///сортируем респонс по idListFromIsar
        final List<ListCreditCardsModel> sortedResponse =
        List.from(response.items)
          ..sort((a, b) => idListFromIsar.indexOf(a.id) - idListFromIsar.indexOf(b.id));

        ref
            .watch(favoritesCreditCardsListStateProvider.notifier)
            .state
            .addAll(sortedResponse);
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
