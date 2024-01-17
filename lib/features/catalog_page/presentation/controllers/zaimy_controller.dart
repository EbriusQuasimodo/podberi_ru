import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/data/credit_cards_data/credit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/data/debit_cards_data/debit_cards_repository.dart';
import 'package:podberi_ru/features/catalog_page/data/zaimy_data/zaimy_repository.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/filters_page/presentation/debit_cards_filters/debit_cards_filters_page_controller.dart';
import 'package:podberi_ru/features/filters_page/presentation/zaimy_filters/zaimy_filters_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///credit cards controller. used for fetch list of products. have required params (product type) which used in [DebitCardsRepository]
class ZaimyController extends AutoDisposeFamilyAsyncNotifier<
    ZaimyModel, BasicApiPageSettingsModel> {
  ZaimyController();

  String productType = '';

  @override
  FutureOr<ZaimyModel> build(BasicApiPageSettingsModel arg) async {
    String filterTerm = '';
    int filterSum = 0;

List<String>filterBanks=[];
    ///выбираем какой провайдер слушать в зависимости от того с какой страницы открыли
    ///(из выбора категории продука, с главной страницы или со страницы всех банков)
    switch (arg.whereFrom) {
      case 'selectProductPage':
        filterTerm = ref.watch(zaimyFilterTermFromSelectProductPageStateProvider);
        arg.filtersModel?.percents =
            ref.watch(zaimyFilterPercentsFromSelectProductPageStateProvider);
        filterSum =
            ref.watch(zaimyFilterSumFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        filterTerm = ref.watch(zaimyFilterTermFromHomePageStateProvider);
        arg.filtersModel?.percents =
            ref.watch(zaimyFilterPercentsFromHomePageStateProvider);
        filterSum =
            ref.watch(zaimyFilterSumFromHomePageStateProvider);

      case 'allBanksPage':
        filterBanks = arg.filtersModel?.banks ?? [];
    }

    final eventRepo = ref.read(zaimyRepositoryProvider);

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

    ///если фильтр по безпроцентному периоду не пустой
    if (filterTerm != '') {
      ///то очищаем полученые фильтры из модели BasicApiPageSettingsModel
      ///и добавляем в эту же модель новые фильтры из filterNoPercentPeriod
      arg.filtersModel?.term = '';
      for (int i = 0; i < filterTerm.length; i++) {
        if (filterTerm.contains('от 30 дней')) {
          arg.filtersModel?.term = '30';
        } else if (filterTerm.contains('от 60 дней')) {
          arg.filtersModel?.term = '60';
        } else if (filterTerm.contains('от 90 дней')) {
          arg.filtersModel?.term = '90';
        } else if (filterTerm.contains('от 120 дней')) {
          arg.filtersModel?.term = '120';
        } else if (filterTerm.contains('от 200 дней')) {
          arg.filtersModel?.term = '200';
        } else {
          arg.filtersModel?.term = '';
        }
      }
    } else {
      arg.filtersModel?.term = '';
    }

    if (filterSum != 0) {
      arg.filtersModel?.sum = filterSum;
    } else {
      arg.filtersModel?.sum = 0;
    }
    arg.page = '1';
    return await eventRepo.fetch(arg, ref);
  }
}

///кататалог для получения кредиток здесь формируются фильтры
final zaimyControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    ZaimyController, ZaimyModel, BasicApiPageSettingsModel>(
  ZaimyController.new,
);
