import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/data/credit_cards_data/credit_cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CreditCardsController extends AutoDisposeAsyncNotifier<List<ListProductModel>> {
  CreditCardsController();
  @override
  FutureOr<List<ListProductModel>> build() async {
    final eventRepo = ref.read(creditCardsRepositoryProvider);
    return await eventRepo.fetch(ref);
  }

  fetchProductDetailsData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(creditCardsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch( ref);
    });
  }
}

final creditCardsControllerProvider =
AutoDisposeAsyncNotifierProvider<CreditCardsController, List<ListProductModel>>(
  CreditCardsController.new,
);