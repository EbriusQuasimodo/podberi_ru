import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/data/zaimy_data/zaimy_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/sort_controllers/debit_cards_sort_controller.dart';
import 'package:podberi_ru/features/filters_page/zaimy/presentation/zaimy_filters_page_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///credit cards controller. used for fetch list of products. have required params (product type) which used in [DebitCardsRepository]
class ZaimyController extends AutoDisposeFamilyAsyncNotifier<ZaimyModel,
    BasicApiPageSettingsModel> {
  ZaimyController();

  @override
  FutureOr<ZaimyModel> build(BasicApiPageSettingsModel arg) async {
    String productTypeWithQuery = arg.productTypeUrl!;

    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        arg.term =
            ref.watch(zaimyFilterTermFromSelectProductPageStateProvider);
        arg.percents =
            ref.watch(zaimyFilterPercentsFromSelectProductPageStateProvider);
        arg.sum =
            ref.watch(zaimyFilterSumFromSelectProductPageStateProvider);
        arg.sort =
            ref.watch(sortFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        arg.sort = ref.watch(sortFromHomePageStateProvider);
        arg.term =
            ref.watch(zaimyFilterTermFromHomePageStateProvider);
        arg.percents =
            ref.watch(zaimyFilterPercentsFromHomePageStateProvider);
        arg.sum =
            ref.watch(zaimyFilterSumFromHomePageStateProvider);

      case "allBanksPage":
        productTypeWithQuery =
            ref.read(productTypeUrlFromAllBanksStateProvider);

      case 'homePageBanks':
        productTypeWithQuery =
            ref.read(productTypeUrlFromHomeBanksStateProvider);
    }
    productTypeWithQuery += '?fetch=10&page=1';

    final zaimyRepo = ref.read(zaimyRepositoryProvider);

    if (arg.percents != 0) {
      ///ищем займы у которых макс процент находится в диапазоне min - max
      productTypeWithQuery +=
          '&min_percent%24lte=${arg.percents}&max_percent%24gte=${arg.percents}';
    }
    if (arg.banks !=null) {
      for (int i = 0; i < arg.banks!.length; i++) {
        productTypeWithQuery +=
            '&bank_details.bank_name=${arg.banks?[i]}';
      }
    }

    ///фильтр по безпроцентному периоду
    if (arg.term != null) {
      ///ищем в диапазоне где min term меньше либо равно выбранному периоду
      ///а max  term больше либо равно выбраному периоду
      if (arg.term == 'от 30 дней') {
        productTypeWithQuery += '&min_term%24lte=30&max_term%24gte=30';
      } else if (arg.term == 'от 60 дней') {
        productTypeWithQuery += '&min_term%24lte=60&max_term%24gte=60';
      } else if (arg.term == 'от 90 дней') {
        productTypeWithQuery += '&min_term%24lte=90&max_term%24gte=90';
      } else if (arg.term == 'от 120 дней') {
        productTypeWithQuery += '&min_term%24lte=120&max_term%24gte=120';
      } else if (arg.term == 'от 200 дней') {
        productTypeWithQuery += '&min_term%24lte=200&max_term%24gte=200';
      }
    }

    ///фильтр по сумме займа
    if (arg.sum != null) {
      productTypeWithQuery += '&sum%24gte=${arg.sum}';
    }

    ///сортировка
    if (arg.sort != '') {
      if (arg.sort == 'По сумме займа') {
        productTypeWithQuery += '&sort\$sum=-1';
      } else if (arg.sort == 'По ставке') {
        productTypeWithQuery += '&sort\$max_percent=1';
      } else if (arg.sort == 'По сроку') {
        productTypeWithQuery += '&sort\$max_term=-1';
      }
    }

    return await zaimyRepo.fetch(productTypeWithQuery, ref);
  }
}

///кататалог для получения кредиток здесь формируются фильтры
final zaimyControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    ZaimyController, ZaimyModel, BasicApiPageSettingsModel>(
  ZaimyController.new,
);
