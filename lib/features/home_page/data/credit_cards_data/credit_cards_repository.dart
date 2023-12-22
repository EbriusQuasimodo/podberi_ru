import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/presentation/controllers/credit_cards_controller.dart';

import 'credit_cards_data_source.dart';


///repository for fetch credit cards
abstract class CreditCardsRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class CreditCardsRepository implements CreditCardsRepositoryImpl {
  CreditCardsRepository();

  @override
  Future<ProductModel> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
    await GetIt.I<CreditCardsGetDataSource>().fetch();

    return response;
  }
}
///репозиторий для получения банковских карт
///вызывается из [creditCardsControllerProvider]
final creditCardsRepositoryProvider =
Provider.autoDispose<CreditCardsRepository>((ref) {
  final fetch = CreditCardsRepository();
  return fetch;
});
