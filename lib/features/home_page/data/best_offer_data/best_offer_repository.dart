import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';

import 'best_offer_data_source.dart';

///repository for fetch best offer bank product
abstract class BestOfferRepositoryImpl {
  Future<void> fetch(AutoDisposeAsyncNotifierProviderRef ref);
}

class BestOfferRepository implements BestOfferRepositoryImpl {
  BestOfferRepository();

  @override
  Future<List<ListProductModel>> fetch(
      AutoDisposeAsyncNotifierProviderRef ref) async {
     List<ListProductModel> _listOfBestOffers = [];
    final responseDebit =
        await GetIt.I<BestOfferGetDataSource>().fetch('debit_cards');
    final responseCredit =
        await GetIt.I<BestOfferGetDataSource>().fetch('credit_cards');
    final responseZaymi =
        await GetIt.I<BestOfferGetDataSource>().fetch('zaymi');
    final responseRko = await GetIt.I<BestOfferGetDataSource>().fetch('rko');
    for (int i = 0; i < responseDebit.length; i++) {
      _listOfBestOffers.add(
        ListProductModel(
          cardName: responseDebit[i].cardName,
          picture: responseDebit[i].picture,
          bankDetails: BankDetailsModel(
              color: responseDebit[i].bankDetails?.color,
              bankName: responseDebit[i].bankDetails?.bankName),
          id: responseDebit[i].id,
        ),
      );
    }
    for (int i = 0; i < responseCredit.length; i++) {
      _listOfBestOffers
          .add(ListProductModel(
        cardName: responseCredit[i].cardName,
        picture: responseCredit[i].picture,
        bankDetails: BankDetailsModel(
            color: responseCredit[i].bankDetails?.color,
            bankName: responseCredit[i].bankDetails?.bankName),
        id: responseCredit[i].id,
      ),);
    }
    for (int i = 0; i < responseZaymi.length; i++) {
      _listOfBestOffers
          .add(ListProductModel(
        cardName: responseZaymi[i].cardName,
        picture: responseZaymi[i].picture,
        bankDetails: BankDetailsModel(
            color: responseZaymi[i].bankDetails?.color,
            bankName: responseZaymi[i].bankDetails?.bankName),
        id: responseZaymi[i].id,
      ),);
    }
    for (int i = 0; i < responseRko.length; i++) {
      _listOfBestOffers
          .add(ListProductModel(
        cardName: responseRko[i].cardName,
        picture: responseRko[i].picture,
        bankDetails: BankDetailsModel(
            color: responseRko[i].bankDetails?.color,
            bankName: responseRko[i].bankDetails?.bankName),
        id: responseRko[i].id,
      ),);
    }
    return _listOfBestOffers;
  }
}

final bestOfferRepositoryProvider =
    Provider.autoDispose<BestOfferRepository>((ref) {
  final fetch = BestOfferRepository();
  return fetch;
});
