import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/sort_controllers/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/filters_page/debit_cards/presentation/debit_cards_filters_page_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///bank products controller. used for fetch list of products. have required params (product type) which used in [DebitCardsRepository]
class DebitCardsController extends AutoDisposeFamilyAsyncNotifier<
    DebitCardsModel, BasicApiPageSettingsModel> {
  DebitCardsController();

  @override
  FutureOr<DebitCardsModel> build(BasicApiPageSettingsModel arg) async {
    String productTypeWithQuery = arg.productTypeUrl!;

    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        arg.filtersModel?.banks =
            ref.watch(debitCardsFilterBanksFromSelectProductPageStateProvider);
        arg.filtersModel!.paySystem = ref
            .watch(debitCardsFilterPaySystemFromSelectProductPageStateProvider);
        // filterCashBack =
        //     ref.watch(debitCardsFilterCashBackFromSelectProductPageStateProvider);
        arg.filtersModel?.sort = ref.watch(sortFromSelectProductPageStateProvider);
        arg.filtersModel?.features = ref.watch(
            debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        arg.filtersModel?.sort = ref.watch(sortFromHomePageStateProvider);
        arg.filtersModel?.banks =
            ref.watch(debitCardsFilterBanksFromHomePageStateProvider);
        arg.filtersModel!.paySystem =
            ref.watch(debitCardsFilterPaySystemFromHomePageStateProvider);
        // filterCashBack = ref.watch(debitCardsFilterCashBackFromHomePageStateProvider);
        arg.filtersModel?.features = ref.watch(
            debitCardsFilterAdditionalConditionsFromHomePageStateProvider);
      case "allBanksPage":
        productTypeWithQuery = ref.read(productTypeUrlFromAllBanksStateProvider);

      case 'homePageBanks':
        productTypeWithQuery = ref.read(productTypeUrlFromHomeBanksStateProvider);
    }
    productTypeWithQuery += '?fetch=10&page=1';
    final debitCardsRepo = ref.read(debitCardsRepositoryProvider);

    ///если фильтр по банкам не пустой
    if (arg.filtersModel!.banks!.isNotEmpty) {
      for (int i = 0; i < arg.filtersModel!.banks!.length; i++) {
        productTypeWithQuery += '&bank_details.bank_name=${arg.filtersModel?.banks?[i]}';
      }
    }

    // ///если фильтр по кэшбеку не пустой
    // if (filterCashBack.isNotEmpty) {
    //   ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
    //   ///и добавляем в эту же модель новые фильтры из filterCashBack
    //   arg.filtersModel?.cashBack?.clear();
    //   for (int i = 0; i < filterCashBack.length; i++) {
    //     if (!filterCashBack.contains('Не важно')) {
    //       arg.filtersModel?.cashBack?.add(filterCashBack[i]);
    //     }
    //   }
    // } else {
    //   arg.filtersModel?.cashBack?.clear();
    // }
    if (arg.filtersModel!.paySystem!.isNotEmpty &&
        !arg.filtersModel!.paySystem!.contains('Не важно')) {
      for (int i = 0; i < arg.filtersModel!.paySystem!.length; i++) {
        productTypeWithQuery += '&payment_system=${arg.filtersModel?.paySystem?[i]}';
      }
    }
    if (arg.filtersModel!.features != null) {
      for (int i = 0; i < arg.filtersModel!.features!.length; i++) {
        productTypeWithQuery += '&features=${arg.filtersModel?.features?[i]}';
      }
    }

    ///если сортировка  не пустая
    if (arg.filtersModel?.sort != '') {
      if (arg.filtersModel?.sort == 'По кэшбеку') {
        productTypeWithQuery += '&sort\$max_cashback=-1';
      } else if (arg.filtersModel?.sort == 'По обслуживанию') {
        productTypeWithQuery += '&sort\$max_service=1';
      }
    }
    arg.page = '1';
    return await debitCardsRepo.fetch(productTypeWithQuery, ref);
  }
}

///кататалог для получения дебетовок здесь формируются фильтры
final debitCardsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    DebitCardsController, DebitCardsModel, BasicApiPageSettingsModel>(
  DebitCardsController.new,
);
