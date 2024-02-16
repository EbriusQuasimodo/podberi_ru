import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/core/utils/favorites/debit_cards/favorites_debit_cards_data.dart';
import 'package:podberi_ru/features/favorites_page/debit_cards/presentation/favorites_debit_cards_controller.dart';

import 'favorites_debit_cards_data_source.dart';

abstract class FavoritesDebitCardsRepositoryImpl {
  Future<void> fetch(String arg, List<FavoritesDebitCardsData> isarData,
      AutoDisposeAsyncNotifierProviderRef ref);
}

class FavoritesDebitCardsRepository
    implements FavoritesDebitCardsRepositoryImpl {
  FavoritesDebitCardsRepository();

  @override
  Future<DebitCardsModel> fetch(
      String url,
      List<FavoritesDebitCardsData> isarData,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    if (url == 'debit_cards') {
      List<ListDebitCardsModel> list = [];
      return DebitCardsModel(itemsCount: 0, items: list);
    } else {
      final response = await GetIt.I<FavoritesDebitCardsGetDataSource>().fetch(
        url,
      );
      if (response.itemsCount <= 10) {
        ///создаем список с айдишниками из изара - по нему будем сортироваться
        List<String> idListFromIsar = [];
        for (int i = 0; i < isarData.length; i++) {
          idListFromIsar.add(isarData[i].id!);
        }
        ///сортируем респонс по idListFromIsar
        final List<ListDebitCardsModel> sortedResponse =
            List.from(response.items)
              ..sort((a, b) => idListFromIsar.indexOf(a.id) - idListFromIsar.indexOf(b.id));
        ref
            .watch(favoritesDebitCardsListStateProvider.notifier)
            .state
            .addAll(sortedResponse);
      }
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
