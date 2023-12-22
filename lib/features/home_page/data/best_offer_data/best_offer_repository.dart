import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/home_page/presentation/controllers/best_offer_controller.dart';

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
    ///здесь поочереди вызываем каждый инстанс и записываем в список лучших банковских продуктов
     List<ListProductModel> _listOfBestOffers = [];
    final responseDebit =
        await GetIt.I<BestOfferGetDataSource>().fetch('debit_cards');
    final responseCredit =
        await GetIt.I<BestOfferGetDataSource>().fetch('credit_cards');
    final responseZaimy =
        await GetIt.I<BestOfferGetDataSource>().fetch('zaimy');
    final responseRko = await GetIt.I<BestOfferGetDataSource>().fetch('rko');
    for (int i = 0; i < responseDebit.items.length; i++) {
      _listOfBestOffers.add(
        ListProductModel(
          cardName: responseDebit.items[i].cardName,
          picture: responseDebit.items[i].picture,
          bankDetails: BankDetailsModel(
              color: responseDebit.items[i].bankDetails?.color,
              bankName: responseDebit.items[i].bankDetails?.bankName),
          id: responseDebit.items[i].id,
        ),
      );
    }
    for (int i = 0; i < responseCredit.items.length; i++) {
      _listOfBestOffers
          .add(ListProductModel(
        cardName: responseCredit.items[i].cardName,
        picture: responseCredit.items[i].picture,
        bankDetails: BankDetailsModel(
            color: responseCredit.items[i].bankDetails?.color,
            bankName: responseCredit.items[i].bankDetails?.bankName),
        id: responseCredit.items[i].id,
      ),);
    }
    for (int i = 0; i < responseZaimy.items.length; i++) {
      _listOfBestOffers
          .add(ListProductModel(
        cardName: responseZaimy.items[i].cardName,
        picture: responseZaimy.items[i].picture,
        bankDetails: BankDetailsModel(
            color: responseZaimy.items[i].bankDetails?.color,
            bankName: responseZaimy.items[i].bankDetails?.bankName),
        id: responseZaimy.items[i].id,
      ),);
    }
    for (int i = 0; i < responseRko.items.length; i++) {
      _listOfBestOffers
          .add(ListProductModel(
        cardName: responseRko.items[i].cardName,
        picture: responseRko.items[i].picture,
        bankDetails: BankDetailsModel(
            color: responseRko.items[i].bankDetails?.color,
            bankName: responseRko.items[i].bankDetails?.bankName),
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
