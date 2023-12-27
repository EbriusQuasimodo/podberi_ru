import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/data/credit_cards_data/credit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///credit cards controller. used for fetch list of products. have required params (product type) which used in [DebitCardsRepository]
class CreditCardsController extends AutoDisposeFamilyAsyncNotifier<
    CreditCardsModel, BasicApiPageSettingsModel> {
  CreditCardsController();

  String productType = '';

  @override
  FutureOr<CreditCardsModel> build(BasicApiPageSettingsModel arg) async {
    List<String> filterBanks = [];
    List<String> filterCashBack = [];
    List<String> filterPaySystem = [];

    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        filterBanks = ref.watch(filterBanksFromSelectProductPageStateProvider);
        filterPaySystem =
            ref.watch(filterPaySystemFromSelectProductPageStateProvider);
        filterCashBack =
            ref.watch(filterCashBackFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        filterBanks = ref.watch(filterBanksFromHomePageStateProvider);
        filterPaySystem = ref.watch(filterPaySystemFromHomePageStateProvider);
        filterCashBack = ref.watch(filterCashBackFromHomePageStateProvider);
      case 'allBanksPage':
        filterBanks = arg.filtersModel?.banks ?? [];
    }

    final eventRepo = ref.read(creditCardsRepositoryProvider);

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

    ///если фильтр по кэшбеку не пустой
    if (filterCashBack.isNotEmpty) {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterCashBack
      arg.filtersModel?.cashBack?.clear();
      for (int i = 0; i < filterCashBack.length; i++) {
        if (!filterCashBack.contains('Не важно')) {
          arg.filtersModel?.cashBack?.add(filterCashBack[i]);
        }
      }
    } else {
      arg.filtersModel?.cashBack?.clear();
    }

    ///если фильтр по платежной системе не пустой
    if (filterPaySystem.isNotEmpty) {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterPaySystem
      arg.filtersModel?.paySystem?.clear();
      for (int i = 0; i < filterPaySystem.length; i++) {
        if (!filterPaySystem.contains('Любая')) {
          arg.filtersModel?.paySystem?.add(filterPaySystem[i]);
        }
      }
    } else {
      arg.filtersModel?.paySystem?.clear();
    }
    arg.page = '1';
    return await eventRepo.fetch(arg, ref);
  }
}

///кататалог для получения кредиток здесь формируются фильтры
final creditCardsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    CreditCardsController, CreditCardsModel, BasicApiPageSettingsModel>(
  CreditCardsController.new,
);

