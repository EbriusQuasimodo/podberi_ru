import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

import 'credit_cards_data_source.dart';


///repository for fetch credit cards
abstract class CreditCardsRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class CreditCardsRepository implements CreditCardsRepositoryImpl {
  CreditCardsRepository();

  @override
  Future<List<ListProductModel>> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
    await GetIt.I<CreditCardsGetDataSource>().fetch();

    return response;
  }
}

final creditCardsRepositoryProvider =
Provider.autoDispose<CreditCardsRepository>((ref) {
  final fetch = CreditCardsRepository();
  return fetch;
});