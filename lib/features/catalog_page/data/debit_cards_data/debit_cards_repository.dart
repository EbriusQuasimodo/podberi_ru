import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';

import 'debit_cards_data_source.dart';

abstract class DebitCardsRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class DebitCardsRepository implements DebitCardsRepositoryImpl {
  DebitCardsRepository();

  @override
  Future<DebitCardsModel> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<DebitCardsGetDataSource>().fetch(arg);

    return response;
  }
}

///репозиторий для получения всех банковских продуктов здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [debitCardsControllerProvider]
final debitCardsRepositoryProvider =
    Provider.autoDispose<DebitCardsRepository>((ref) {
  final fetch = DebitCardsRepository();
  return fetch;
});
