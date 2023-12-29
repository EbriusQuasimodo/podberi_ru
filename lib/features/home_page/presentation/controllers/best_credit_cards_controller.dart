import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/home_page/data/best_credit_cards_data/best_credit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class BestCreditCardsController extends AutoDisposeAsyncNotifier<CreditCardsModel> {
  BestCreditCardsController();
  @override
  FutureOr<CreditCardsModel> build() async {
    final eventRepo = ref.read(bestCreditCardsRepositoryProvider);
    return await eventRepo.fetch(ref);
  }

}
///контроллер для получения кредитных карт
final bestCreditCardsControllerProvider =
AutoDisposeAsyncNotifierProvider<BestCreditCardsController,CreditCardsModel>(
  BestCreditCardsController.new,
);