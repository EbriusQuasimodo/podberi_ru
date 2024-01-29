import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/data/credit_cards_data/credit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/sort_controllers/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/filters_page/credit_cards/presentation/credit_cards_filters_page_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///credit cards controller. used for fetch list of products. have required params (product type) which used in [DebitCardsRepository]
class CreditCardsController extends AutoDisposeFamilyAsyncNotifier<
    CreditCardsModel, BasicApiPageSettingsModel> {
  CreditCardsController();

  @override
  FutureOr<CreditCardsModel> build(BasicApiPageSettingsModel arg) async {
    String productTypeWithQuery = arg.productTypeUrl!;

    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        arg.filtersModel?.noPercentPeriod = ref.watch(
            creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider);
        arg.filtersModel?.percents = ref
            .watch(creditCardsFilterPercentsFromSelectProductPageStateProvider);
        arg.filtersModel?.features = ref.watch(
            creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider);
        arg.filtersModel?.creditLimit = ref.watch(
            creditCardsFilterCreditLimitFromSelectProductPageStateProvider);
        arg.filtersModel!.sort =
            ref.watch(sortFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        arg.filtersModel!.sort = ref.watch(sortFromHomePageStateProvider);
        arg.filtersModel?.noPercentPeriod = ref
            .watch(creditCardsFilterNoPercentPeriodFromHomePageStateProvider);
        arg.filtersModel?.percents =
            ref.watch(creditCardsFilterPercentsFromHomePageStateProvider);
        arg.filtersModel?.features = ref.watch(
            creditCardsFilterAdditionalConditionsFromHomePageStateProvider);
        arg.filtersModel?.creditLimit =
            ref.watch(creditCardsFilterCreditLimitFromHomePageStateProvider);
        ///если открыли со страницы банков то единственный фильтр это банк который выбрали
      case 'allBanksPage':
        productTypeWithQuery = ref.read(productTypeUrlFromAllBanksStateProvider);
      case 'homePageBanks':
        productTypeWithQuery = ref.read(productTypeUrlFromHomeBanksStateProvider);
    }

    final creditCardsRepo = ref.read(creditCardsRepositoryProvider);
    productTypeWithQuery += '?fetch=10&page=1';

    ///фильтр по банкам
    if (arg.filtersModel!.banks!.isNotEmpty) {
      for (int i = 0; i < arg.filtersModel!.banks!.length; i++) {
        productTypeWithQuery += '&bank_details.bank_name=${arg.filtersModel?.banks?[i]}';
      }
    }

    ///фильтр по безпроцентному периоду
    if (arg.filtersModel!.noPercentPeriod != null) {
      if (arg.filtersModel!.noPercentPeriod == 'от 30 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=30';
      } else if (arg.filtersModel!.noPercentPeriod == 'от 60 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=60';
      } else if (arg.filtersModel!.noPercentPeriod == 'от 90 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=90';
      } else if (arg.filtersModel!.noPercentPeriod == 'от 120 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=120';
      } else if (arg.filtersModel!.noPercentPeriod == 'от 200 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=200';
      }
    }

    ///фильтр про ставке
    if (arg.filtersModel!.percents != 0) {
      ///ищем кредитки у которых макс процент находится в диапазоне min - max
      productTypeWithQuery +=
          '&min_percent%24lte=${arg.filtersModel!.percents}&max_percent%24gte=${arg.filtersModel!.percents}';
    }

    ///фильтр по кредитному лимиту
    if (arg.filtersModel?.creditLimit != null) {
      productTypeWithQuery += '&credit_limit%24gte=${arg.filtersModel?.creditLimit}';
    }

    ///фильтр по фичам
    if (arg.filtersModel!.features != null) {
      for (int i = 0; i < arg.filtersModel!.features!.length; i++) {
        productTypeWithQuery += '&features=${arg.filtersModel?.features?[i]}';
      }
    }

    ///сортировка
    if (arg.filtersModel!.sort != '') {
      if (arg.filtersModel!.sort == 'По льготному периоду') {
        productTypeWithQuery += '&sort\$no_percent_period=-1';
      } else if (arg.filtersModel!.sort == 'По лимиту') {
        productTypeWithQuery += '&sort\$credit_limit=-1';
      } else if (arg.filtersModel!.sort == 'По ставке') {
        productTypeWithQuery += '&sort\$max_percent=1';
      }
    }

    arg.page = '1';
    return await creditCardsRepo.fetch(productTypeWithQuery, ref);
  }
}

///кататалог для получения кредиток здесь формируются фильтры
final creditCardsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    CreditCardsController, CreditCardsModel, BasicApiPageSettingsModel>(
  CreditCardsController.new,
);
