import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/data/best_offer_data/best_offer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class BestOfferController extends AutoDisposeAsyncNotifier<List<ListProductModel>> {
  BestOfferController();
  @override
  FutureOr<List<ListProductModel>> build() async {
    final eventRepo = ref.read(bestOfferRepositoryProvider);
    return await eventRepo.fetch(ref);
  }

  fetchProductDetailsData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(bestOfferRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch( ref);
    });
  }
}
///контроллер для получения лучших предложений
final bestOfferControllerProvider =
AutoDisposeAsyncNotifierProvider<BestOfferController, List<ListProductModel>>(
  BestOfferController.new,
);