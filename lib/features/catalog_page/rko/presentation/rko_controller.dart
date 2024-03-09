import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/rko/data/rko_repository.dart';
import 'package:podberi_ru/features/catalog_page/sorting/debit_cards/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

class RkoController extends AutoDisposeFamilyAsyncNotifier<
    RkoModel, BasicApiPageSettingsModel> {
  RkoController();

  @override
  FutureOr<RkoModel> build(BasicApiPageSettingsModel arg) async {
    String productTypeWithQuery = arg.productTypeUrl!;

    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        arg.filters.sort = ref.watch(sortFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        arg.filters.sort = ref.watch(sortFromHomePageStateProvider);
      case "allBanksPage":
        productTypeWithQuery = ref.read(productTypeUrlFromAllBanksStateProvider);

      case 'homePageBanks':
        productTypeWithQuery = ref.read(productTypeUrlFromHomeBanksStateProvider);
    }
    productTypeWithQuery += '?fetch=10&page=${arg.page}';
    final rkoRepo = ref.watch(rkoRepositoryProvider);

    ///если фильтр по банкам не пустой
    if (arg.filters.banks !=null) {
      for (int i = 0; i < arg.filters.banks!.length; i++) {
        productTypeWithQuery += '&bank_details.bank_name=${arg.filters.banks?[i]}';
      }
    }


    if (arg.filters.features != null) {
      for (int i = 0; i < arg.filters.features!.length; i++) {
        productTypeWithQuery += '&features=${arg.filters.features?[i]}';
      }
    }

    ///если сортировка  не пустая
    if (arg.filters.sort != '') {
     if (arg.filters.sort == 'По обслуживанию') {
        productTypeWithQuery += '&sort\$rates.service_1_month=1';
      }
    }
    ref.keepAlive();
    return await rkoRepo.fetch(productTypeWithQuery,arg.whereFrom!, ref);

  }
}

///кататалог для получения рко здесь формируются фильтры
final rkoControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    RkoController, RkoModel, BasicApiPageSettingsModel>(
  RkoController.new,
);
