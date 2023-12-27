import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/home_page/presentation/controllers/best_offer_controller.dart';

import 'best_offer_data_source.dart';

///repository for fetch best offer bank product
abstract class BestOfferRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class BestOfferRepository implements BestOfferRepositoryImpl {
  BestOfferRepository();

  @override
  Future<List<ListDebitCardsModel>> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
    ///здесь поочереди вызываем каждый инстанс и записываем в список лучших банковских продуктов
     List<ListDebitCardsModel> _listOfBestOffers = [];
    final responseDebit =
        await GetIt.I<BestOfferGetDataSource>().fetch('debit_cards');
    final responseCredit =
        await GetIt.I<BestOfferGetDataSource>().fetch('credit_cards');
    final responseZaimy =
        await GetIt.I<BestOfferGetDataSource>().fetch('zaimy');
    final responseRko = await GetIt.I<BestOfferGetDataSource>().fetch('rko');
    for (int i = 0; i < responseDebit.items.length; i++) {
      _listOfBestOffers.add(
        ListDebitCardsModel(
          name: responseDebit.items[i].name,
          image: responseDebit.items[i].image,
          bankDetails: BankListDetailsModel(
              color: responseDebit.items[i].bankDetails!.color,
              bankName: responseDebit.items[i].bankDetails!.bankName),
          id: responseDebit.items[i].id,
        ),
      );
    }
    for (int i = 0; i < responseCredit.items.length; i++) {
      _listOfBestOffers
          .add(ListDebitCardsModel(
        name: responseCredit.items[i].name,
        image: responseCredit.items[i].image,
        bankDetails: BankListDetailsModel(
            color: responseCredit.items[i].bankDetails!.color,
            bankName: responseCredit.items[i].bankDetails!.bankName),
        id: responseCredit.items[i].id,
      ),);
    }
    for (int i = 0; i < responseZaimy.items.length; i++) {
      _listOfBestOffers
          .add(ListDebitCardsModel(
        name: responseZaimy.items[i].name,
        image: responseZaimy.items[i].image,
        bankDetails: BankListDetailsModel(
            color: responseZaimy.items[i].bankDetails!.color,
            bankName: responseZaimy.items[i].bankDetails!.bankName),
        id: responseZaimy.items[i].id,
      ),);
    }
    for (int i = 0; i < responseRko.items.length; i++) {
      _listOfBestOffers
          .add(ListDebitCardsModel(
        name: responseRko.items[i].name,
        image: responseRko.items[i].image,
        bankDetails: BankListDetailsModel(
            color: responseRko.items[i].bankDetails!.color,
            bankName: responseRko.items[i].bankDetails!.bankName),
        id: responseRko.items[i].id,
      ),);
    }
    return _listOfBestOffers;
  }
}

///репозиторий для получения списка лучших предложений
///вызывается из [bestOfferControllerProvider]
final bestOfferRepositoryProvider =
    Provider.autoDispose<BestOfferRepository>((ref) {
  final fetch = BestOfferRepository();
  return fetch;
});
