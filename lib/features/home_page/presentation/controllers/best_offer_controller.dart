import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/home_page/data/best_offer_data/best_offer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class BestOfferController extends AutoDisposeAsyncNotifier<List<ListDebitCardsModel>> {
  BestOfferController();
  @override
  FutureOr<List<ListDebitCardsModel>> build() async {
    final bestOfferRepo = ref.read(bestOfferRepositoryProvider);
    return await bestOfferRepo.fetch(ref);
  }

}
///контроллер для получения лучших предложений
final bestOfferControllerProvider =
AutoDisposeAsyncNotifierProvider<BestOfferController, List<ListDebitCardsModel>>(
  BestOfferController.new,
);