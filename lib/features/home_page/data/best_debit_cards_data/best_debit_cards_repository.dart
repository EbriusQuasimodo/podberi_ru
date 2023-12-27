import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/home_page/presentation/controllers/best_debit_cards_controller.dart';

import 'best_debit_cards_data_source.dart';


///repository for fetch debit cards
abstract class BestDebitCardsRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class BestDebitCardsRepository implements BestDebitCardsRepositoryImpl {
  BestDebitCardsRepository();

  @override
  Future<DebitCardsModel> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response =
    await GetIt.I<BestDebitCardsGetDataSource>().fetch();

    return response;
  }
}

///репозиторий для получения дебетовых карт
///вызвается из [bestDebitCardsControllerProvider]
final bestDebitCardsRepositoryProvider =
Provider.autoDispose<BestDebitCardsRepository>((ref) {
  final fetch = BestDebitCardsRepository();
  return fetch;
});
