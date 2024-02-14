import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/credit_cards/data/credit_cards_repository.dart';
import 'package:podberi_ru/core/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/sorting/debit_cards/debit_cards_sort_controller.dart';
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
        arg.filters.sort =
            ref.watch(sortFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        arg.filters.sort = ref.watch(sortFromHomePageStateProvider);
        ///если открыли со страницы банков то единственный фильтр это банк который выбрали
      case 'allBanksPage':
        productTypeWithQuery = ref.read(productTypeUrlFromAllBanksStateProvider);
      case 'homePageBanks':
        productTypeWithQuery = ref.read(productTypeUrlFromHomeBanksStateProvider);
    }

    final creditCardsRepo = ref.watch(creditCardsRepositoryProvider);
    productTypeWithQuery += '?fetch=10&page=${arg.page}';

    ///фильтр по банкам
    if (arg.filters.banks !=null) {
      for (int i = 0; i < arg.filters.banks!.length; i++) {
        productTypeWithQuery += '&bank_details.bank_name=${arg.filters.banks?[i]}';
      }
    }

    ///фильтр по безпроцентному периоду
    if (arg.filters.noPercentPeriod != null) {
      if (arg.filters.noPercentPeriod == 'от 30 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=30';
      } else if (arg.filters.noPercentPeriod == 'от 60 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=60';
      } else if (arg.filters.noPercentPeriod == 'от 90 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=90';
      } else if (arg.filters.noPercentPeriod == 'от 120 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=120';
      } else if (arg.filters.noPercentPeriod == 'от 200 дней') {
        productTypeWithQuery += '&no_percent_period%24gte=200';
      }
    }

    ///фильтр про ставке
    if (arg.filters.percents != null &&arg.filters.percents != 0) {
      ///ищем кредитки у которых макс процент находится в диапазоне min - max
      productTypeWithQuery +=
          '&min_percent%24lte=${arg.filters.percents}&max_percent%24gte=${arg.filters.percents}';
    }

    ///фильтр по кредитному лимиту
    if (arg.filters.creditLimit !=null &&arg.filters.creditLimit !=0) {
      productTypeWithQuery += '&credit_limit%24gte=${arg.filters.creditLimit}';
    }

    ///фильтр по фичам
    if (arg.filters.features != null) {
      for (int i = 0; i < arg.filters.features!.length; i++) {
        productTypeWithQuery += '&features=${arg.filters.features?[i]}';
      }
    }

    ///сортировка
    if (arg.filters.sort != '') {
      if (arg.filters.sort == 'По льготному периоду') {
        productTypeWithQuery += '&sort\$no_percent_period=-1';
      } else if (arg.filters.sort == 'По лимиту') {
        productTypeWithQuery += '&sort\$credit_limit=-1';
      } else if (arg.filters.sort == 'По ставке') {
        productTypeWithQuery += '&sort\$max_percent=1';
      }
    }
    ref.keepAlive();
    return await creditCardsRepo.fetch(productTypeWithQuery,arg.whereFrom!, ref);
  }
}

///кататалог для получения кредиток здесь формируются фильтры
final creditCardsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    CreditCardsController, CreditCardsModel, BasicApiPageSettingsModel>(
  CreditCardsController.new,
);
