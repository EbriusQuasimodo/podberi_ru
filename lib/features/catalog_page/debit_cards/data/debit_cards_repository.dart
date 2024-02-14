import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/debit_cards/presentation/debit_cards_controller.dart';
import 'package:podberi_ru/core/domain/debit_cards_model/debit_cards_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'debit_cards_data_source.dart';

abstract class DebitCardsRepositoryImpl {
  Future<void> fetch(String url, String whereFrom, AutoDisposeAsyncNotifierProviderRef ref);
}

class DebitCardsRepository implements DebitCardsRepositoryImpl {
  DebitCardsRepository();

  @override
  Future<DebitCardsModel> fetch(
      String url,String whereFrom, AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<DebitCardsGetDataSource>().fetch(url);
    if(whereFrom == AppRoute.homePage.name || whereFrom ==  'homePageBanks'){
      ref.watch(itemsCountFromHomePageStateProvider.notifier).state =response.itemsCount;
    }else if(whereFrom == AppRoute.selectProductPage.name ||whereFrom ==  AppRoute.allBanksPage.name){
      ref.watch(itemsCountFromSelectProductPageStateProvider.notifier).state =response.itemsCount;
    }

    return response;
  }
}

///репозиторий для получения всех банковских продуктов здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [debitCardsControllerProvider]
final debitCardsRepositoryProvider =
    Provider.autoDispose<DebitCardsRepository>((ref) {
  final fetch = DebitCardsRepository();
  return fetch;
});
