import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';

import 'credit_cards_data_source.dart';

abstract class CreditCardsRepositoryImpl {
  Future<void> fetch(
      String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class CreditCardsRepository implements CreditCardsRepositoryImpl {
  CreditCardsRepository();

  @override
  Future<CreditCardsModel> fetch(String arg,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
        await GetIt.I<CreditCardsGetDataSource>().fetch(arg);
print(arg);
    return response;
  }
}

///репозиторий для получения кредиток здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [creditCardsControllerProvider]
final creditCardsRepositoryProvider =
    Provider.autoDispose<CreditCardsRepository>((ref) {
  final fetch = CreditCardsRepository();
  return fetch;
});
