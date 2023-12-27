import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/home_page/presentation/controllers/best_credit_cards_controller.dart';

import 'best_credit_cards_data_source.dart';


///repository for fetch credit cards
abstract class BestCreditCardsRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class BestCreditCardsRepository implements BestCreditCardsRepositoryImpl {
  BestCreditCardsRepository();

  @override
  Future<CreditCardsModel> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
    await GetIt.I<BestCreditCardsGetDataSource>().fetch();

    return response;
  }
}
///репозиторий для получения банковских карт
///вызывается из [bestCreditCardsControllerProvider]
final bestCreditCardsRepositoryProvider =
Provider.autoDispose<BestCreditCardsRepository>((ref) {
  final fetch = BestCreditCardsRepository();
  return fetch;
});
