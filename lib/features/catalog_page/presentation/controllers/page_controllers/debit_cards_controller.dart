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

final debitCardsPageFromHomePageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});
final debitCardsPageFromSelectProductPageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});

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

        arg.banks =
            ref.watch(debitCardsFilterBanksFromSelectProductPageStateProvider);
        arg.paySystem = ref
            .watch(debitCardsFilterPaySystemFromSelectProductPageStateProvider);
        // filterCashBack =
        //     ref.watch(debitCardsFilterCashBackFromSelectProductPageStateProvider);
        arg.sort = ref.watch(sortFromSelectProductPageStateProvider);
        arg.features = ref.watch(
            debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider);
        break;
      case 'homePage':
        arg.sort = ref.watch(sortFromHomePageStateProvider);
        arg.banks =
            ref.watch(debitCardsFilterBanksFromHomePageStateProvider);
        arg.paySystem =
            ref.watch(debitCardsFilterPaySystemFromHomePageStateProvider);
        // filterCashBack = ref.watch(debitCardsFilterCashBackFromHomePageStateProvider);
        arg.features = ref.watch(
            debitCardsFilterAdditionalConditionsFromHomePageStateProvider);
      case "allBanksPage":
        productTypeWithQuery = ref.read(productTypeUrlFromAllBanksStateProvider);

      case 'homePageBanks':
        productTypeWithQuery = ref.read(productTypeUrlFromHomeBanksStateProvider);
    }
    productTypeWithQuery += '?fetch=10&page=${arg.page}';
    final debitCardsRepo = ref.read(debitCardsRepositoryProvider);

    ///если фильтр по банкам не пустой
    if (arg.banks !=null) {
      for (int i = 0; i < arg.banks!.length; i++) {
        productTypeWithQuery += '&bank_details.bank_name=${arg.banks?[i]}';
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
    if (arg.paySystem!.isNotEmpty &&
        !arg.paySystem!.contains('Не важно')) {
      for (int i = 0; i < arg.paySystem!.length; i++) {
        productTypeWithQuery += '&payment_system=${arg.paySystem?[i]}';
      }
    }
    if (arg.features != null) {
      for (int i = 0; i < arg.features!.length; i++) {
        productTypeWithQuery += '&features=${arg.features?[i]}';
      }
    }

    ///если сортировка  не пустая
    if (arg.sort != '') {
      if (arg.sort == 'По кэшбеку') {
        productTypeWithQuery += '&sort\$max_cashback=-1';
      } else if (arg.sort == 'По обслуживанию') {
        productTypeWithQuery += '&sort\$max_service=1';
      }
    }
    print(productTypeWithQuery);
    return await debitCardsRepo.fetch(productTypeWithQuery, ref);
  }
}

///кататалог для получения дебетовок здесь формируются фильтры
final debitCardsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    DebitCardsController, DebitCardsModel, BasicApiPageSettingsModel>(
  DebitCardsController.new,
);
