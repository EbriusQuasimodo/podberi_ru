import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/data/credit_cards_data/credit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/filters_page/presentation/credit_cards_filters/credit_cards_filters_page_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/debit_cards_filters/debit_cards_filters_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///credit cards controller. used for fetch list of products. have required params (product type) which used in [DebitCardsRepository]
class CreditCardsController extends AutoDisposeFamilyAsyncNotifier<
    CreditCardsModel, BasicApiPageSettingsModel> {
  CreditCardsController();

  String productType = '';

  @override
  FutureOr<CreditCardsModel> build(BasicApiPageSettingsModel arg) async {
    String filterNoPercentPeriod = '';
   int filterCreditLimit = 0;
   String filterPercents = '';
    List<String> filterFeatures = [];
    List<String> filterBank = [];

    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        filterNoPercentPeriod = ref.watch(creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider);
        filterPercents =
            ref.watch(creditCardsFilterPercentsFromSelectProductPageStateProvider);
        filterFeatures =
            ref.watch(creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        filterNoPercentPeriod = ref.watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider);
        filterPercents = ref.watch(creditCardsFilterPercentsFromHomePageStateProvider);
        filterFeatures = ref.watch(creditCardsFilterAdditionalConditionsFromHomePageStateProvider);
      case 'allBanksPage':
        filterBank = arg.filtersModel?.banks ?? [];
    }

    final eventRepo = ref.read(creditCardsRepositoryProvider);

    ///проверяем откуда пришли
    ///(фильтры когда мы приходим со страницы банков отличаются от тех
    ///когда приходим со страницы по какой-то категории
    if (arg.whereFrom != 'allBanksPage' && arg.whereFrom != 'homePageBanks') {
      ///если фильтр по банкам не пустой
      if (filterBank.isNotEmpty) {
        ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
        ///и добавляем в эту же модель новые фильтры из filterBanks
        arg.filtersModel?.banks?.clear();
        for (int i = 0; i < filterBank.length; i++) {
          arg.filtersModel?.banks?.add(filterBank[i]);
        }
      } else {
        arg.filtersModel?.banks?.clear();
      }
    }

    ///если фильтр по безпроцентному периоду не пустой
    if (filterNoPercentPeriod.isNotEmpty) {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterNoPercentPeriod
      arg.filtersModel?.noPercentPeriod = '';
      for (int i = 0; i < filterNoPercentPeriod.length; i++) {
        if (!filterNoPercentPeriod.contains('Не важно')) {
          arg.filtersModel?.noPercentPeriod = filterNoPercentPeriod[i];
        }
      }
    } else {
      arg.filtersModel?.noPercentPeriod ='';
    }

    ///если фильтр по процентной ставке не пустой
    if (filterPercents.isNotEmpty) {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterPercents
      arg.filtersModel?.percents ='';
      for (int i = 0; i < filterPercents.length; i++) {
        if (!filterPercents.contains('Не важно')) {
          arg.filtersModel?.percents = filterPercents[i];
        }
      }
    } else {
      arg.filtersModel?.percents = '';
    }

    ///если фильтр по доп услугам (фичам)  не пустой
    if (filterFeatures.isNotEmpty) {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterFeatures
      arg.filtersModel?.features?.clear();
      for (int i = 0; i < filterFeatures.length; i++) {
        if (!filterFeatures.contains('Любая')) {
          arg.filtersModel?.features?.add(filterFeatures[i]);
        }
      }
    } else {
      arg.filtersModel?.features?.clear();
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

