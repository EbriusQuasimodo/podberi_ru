import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/home_page/data/best_debit_cards_data/best_debit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class BestDebitCardsController extends AutoDisposeAsyncNotifier<DebitCardsModel> {
  BestDebitCardsController();
  @override
  FutureOr<DebitCardsModel> build() async {
    final eventRepo = ref.read(bestDebitCardsRepositoryProvider);
    return await eventRepo.fetch(ref);
  }

  fetchProductDetailsData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(bestDebitCardsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch(ref);
    });
  }
}
///контроллер для получения дебетовых карт
final bestDebitCardsControllerProvider =
AutoDisposeAsyncNotifierProvider<BestDebitCardsController, DebitCardsModel>(
  BestDebitCardsController.new,
);