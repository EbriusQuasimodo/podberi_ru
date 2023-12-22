import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class DebitCardsController extends AutoDisposeAsyncNotifier<ProductModel> {
  DebitCardsController();
  @override
  FutureOr<ProductModel> build() async {
    final eventRepo = ref.read(debitCardsRepositoryProvider);
    return await eventRepo.fetch(ref);
  }

  fetchProductDetailsData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(debitCardsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch(ref);
    });
  }
}
///контроллер для получения дебетовых карт
final debitCardsControllerProvider =
AutoDisposeAsyncNotifierProvider<DebitCardsController, ProductModel>(
  DebitCardsController.new,
);