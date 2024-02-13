import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/core/routing/app_routes.dart';
import 'package:podberi_ru/features/catalog_page/debit_cards/presentation/debit_cards_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'rko_data_source.dart';


abstract class RkoRepositoryImpl {
  Future<void> fetch(String url, String whereFrom, AutoDisposeAsyncNotifierProviderRef ref);
}

class RkoRepository implements RkoRepositoryImpl {
  RkoRepository();

  @override
  Future<RkoModel> fetch(
      String url,String whereFrom, AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<RkoGetDataSource>().fetch(url);
    if(whereFrom == AppRoute.homePage.name || whereFrom ==  'homePageBanks'){
      ref.watch(itemsCountFromHomePageStateProvider.notifier).state =response.itemsCount;
    }else if(whereFrom == AppRoute.selectProductPage.name ||whereFrom ==  AppRoute.allBanksPage.name){
      ref.watch(itemsCountFromSelectProductPageStateProvider.notifier).state =response.itemsCount;
    }
    //ref.keepAlive();
    return response;
  }
}

///репозиторий для получения всех рко здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [rkoControllerProvider]
final rkoRepositoryProvider =
    Provider.autoDispose<RkoRepository>((ref) {
  final fetch = RkoRepository();
  return fetch;
});
