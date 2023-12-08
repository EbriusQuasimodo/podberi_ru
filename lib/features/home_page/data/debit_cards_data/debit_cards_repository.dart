import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

import 'debit_cards_data_source.dart';


///repository for fetch debit cards
abstract class DebitCardsRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class DebitCardsRepository implements DebitCardsRepositoryImpl {
  DebitCardsRepository();

  @override
  Future<List<ListProductModel>> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
    await GetIt.I<DebitCardsGetDataSource>().fetch();

    return response;
  }
}

final debitCardsRepositoryProvider =
Provider.autoDispose<DebitCardsRepository>((ref) {
  final fetch = DebitCardsRepository();
  return fetch;
});
