import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/sort_controllers/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/debit_cards_filters/debit_cards_filters_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///bank products controller. used for fetch list of products. have required params (product type) which used in [DebitCardsRepository]
class DebitCardsController extends AutoDisposeFamilyAsyncNotifier<
    DebitCardsModel, BasicApiPageSettingsModel> {
  DebitCardsController();

  String productType = '';

  @override
  FutureOr<DebitCardsModel> build(BasicApiPageSettingsModel arg) async {
    List<String> filterBanks = [];
    //List<String> filterCashBack = [];
    List<String> filterPaySystem = [];
    String sort='';

    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        filterBanks = ref.watch(debitCardsFilterBanksFromSelectProductPageStateProvider);
        filterPaySystem =
            ref.watch(debitCardsFilterPaySystemFromSelectProductPageStateProvider);
        // filterCashBack =
        //     ref.watch(debitCardsFilterCashBackFromSelectProductPageStateProvider);
        sort = ref.watch(
            sortFromSelectProductPageStateProvider);
        arg.filtersModel?.features = ref.watch(
            debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        sort = ref.watch(
            sortFromHomePageStateProvider);
        filterBanks = ref.watch(debitCardsFilterBanksFromHomePageStateProvider);
        filterPaySystem = ref.watch(debitCardsFilterPaySystemFromHomePageStateProvider);
        // filterCashBack = ref.watch(debitCardsFilterCashBackFromHomePageStateProvider);
        arg.filtersModel?.features = ref.watch(
            debitCardsFilterAdditionalConditionsFromHomePageStateProvider);
      case 'allBanksPage':
        filterBanks = arg.filtersModel?.banks ?? [];
    }

    final eventRepo = ref.read(debitCardsRepositoryProvider);

    ///проверяем откуда пришли
    ///(фильтры когда мы приходим со страницы банков отличаются от тех когда приходим со страницы по какой-то категории
    if (arg.whereFrom != 'allBanksPage' && arg.whereFrom != 'homePageBanks') {
      ///если фильтр по банкам не пустой
      if (filterBanks.isNotEmpty) {
        ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
        ///и добавляем в эту же модель новые фильтры из filterBanks
        arg.filtersModel?.banks?.clear();
        for (int i = 0; i < filterBanks.length; i++) {
          arg.filtersModel?.banks?.add(filterBanks[i]);
        }
      } else {
        arg.filtersModel?.banks?.clear();
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

    ///если фильтр по платежной системе не пустой
    if (filterPaySystem.isNotEmpty) {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterPaySystem
      arg.filtersModel?.paySystem?.clear();
      for (int i = 0; i < filterPaySystem.length; i++) {
        if (!filterPaySystem.contains('Не важно')) {
          arg.filtersModel?.paySystem?.add(filterPaySystem[i]);
        }
      }
    } else {
      arg.filtersModel?.paySystem?.clear();
    }

    ///если сортировка  не пустая
    if (sort != '') {
      arg.filtersModel?.sort = '';

        if (sort == 'По кэшбеку') {
          arg.filtersModel?.sort = 'max_cashback=-1';
        } else if (sort == 'По обслуживанию') {
          arg.filtersModel?.sort = 'max_service=1';
        } else if (sort == 'По умолчанию') {
          arg.filtersModel?.sort = '';
        }else {
          arg.filtersModel?.sort = '';
        }

    } else {
      arg.filtersModel?.sort = '';
    }
    arg.page = '1';
    return await eventRepo.fetch(arg, ref);
  }
}

///кататалог для получения дебетовок здесь формируются фильтры
final debitCardsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    DebitCardsController, DebitCardsModel, BasicApiPageSettingsModel>(
  DebitCardsController.new,
);

