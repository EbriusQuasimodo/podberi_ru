import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/data/credit_cards_data/credit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/sort_controllers/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/credit_cards_filters/credit_cards_filters_page_controller.dart';

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
    List<String> filterBank = [];
    String sort='';
    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        filterNoPercentPeriod = ref.watch(
            creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider);
        arg.filtersModel?.percents = ref
            .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider);
        arg.filtersModel?.features = ref.watch(
            creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider);
        filterCreditLimit = ref.watch(creditCardsFilterCreditLimitFromSelectProductPageStateProvider);
        sort = ref.watch(
            sortFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        sort = ref.watch(
            sortFromHomePageStateProvider);
        filterNoPercentPeriod = ref
            .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider);
        arg.filtersModel?.percents =
            ref.watch(creditCardsFilterPercentsFromHomePageStateProvider);
        arg.filtersModel?.features = ref.watch(
            creditCardsFilterAdditionalConditionsFromHomePageStateProvider);
        filterCreditLimit = ref.watch(creditCardsFilterCreditLimitFromHomePageStateProvider);
      case 'allBanksPage':
        filterBank = arg.filtersModel?.banks ?? [];
    }

    final eventRepo =  ref.read(creditCardsRepositoryProvider);

    ///проверяем с какой страницы пришли.
    ///фильтры когда мы приходим со страницы банков отличаются от тех
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
    if (filterNoPercentPeriod != '') {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterNoPercentPeriod
      arg.filtersModel?.noPercentPeriod = '';
      for (int i = 0; i < filterNoPercentPeriod.length; i++) {
        if (filterNoPercentPeriod.contains('от 30 дней')) {
          arg.filtersModel?.noPercentPeriod = '30';
        } else if (filterNoPercentPeriod.contains('от 60 дней')) {
          arg.filtersModel?.noPercentPeriod = '60';
        } else if (filterNoPercentPeriod.contains('от 90 дней')) {
          arg.filtersModel?.noPercentPeriod = '90';
        } else if (filterNoPercentPeriod.contains('от 120 дней')) {
          arg.filtersModel?.noPercentPeriod = '120';
        } else if (filterNoPercentPeriod.contains('от 200 дней')) {
          arg.filtersModel?.noPercentPeriod = '200';
        } else {
          arg.filtersModel?.noPercentPeriod = '';
        }
      }
    } else {
      arg.filtersModel?.noPercentPeriod = '';
    }

    if (filterCreditLimit != 0) {
      arg.filtersModel?.creditLimit = filterCreditLimit;
    } else {
      arg.filtersModel?.creditLimit = 0;
    }

    ///если сортировка  не пустая
    if (sort != '') {
      arg.filtersModel?.sort = '';

      if (sort == 'По льготному периоду') {
        arg.filtersModel?.sort = 'no_percent_period=-1';
      } else if (sort == 'По лимиту') {
        arg.filtersModel?.sort = 'credit_limit=-1';
      }else if (sort == 'По ставке') {
        arg.filtersModel?.sort = 'max_percent=1';
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

///кататалог для получения кредиток здесь формируются фильтры
final creditCardsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    CreditCardsController, CreditCardsModel, BasicApiPageSettingsModel>(
  CreditCardsController.new,
);
