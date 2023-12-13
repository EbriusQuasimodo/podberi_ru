import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/features/catalog_page/data/bank_products_repository.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';
import 'package:podberi_ru/features/catalog_page/presentation/select_product_type_page.dart';
import 'package:podberi_ru/features/filters_page/presentation/filters_page_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///product type title which select on [SelectProductTypePage] used for title in [CatalogPage]
final productTypeTitleFromCatalogStateProvider =
    StateProvider.autoDispose<String>((ref) {
  return '';
});

///product type url which select on [SelectProductTypePage] used for instance in api
final productTypeUrlFromCatalogStateProvider =
    StateProvider.autoDispose<String>((ref) {
  return '';
});

///bank products controller. used for fetch list of products. have required params (product type) which used in [BankProductsRepository]
class BankProductsController extends AutoDisposeFamilyAsyncNotifier<
    List<ListProductModel>, FiltersModel> {
  BankProductsController();

  String productType = '';

  @override
  FutureOr<List<ListProductModel>> build(FiltersModel arg) async {
    final filterBanks = arg.productType == 'selectProductPage'
        ? ref.watch(filterBanksFromSelectProductPageStateProvider)
        : ref.watch(filterBanksFromHomePageStateProvider);
    final filterCashBack = arg.productType == 'selectProductPage'
        ? ref.watch(filterCashBackFromSelectProductPageStateProvider)
        : ref.watch(filterCashBackFromHomePageStateProvider);
    final filterPaySystem = arg.productType == 'selectProductPage'
        ? ref.watch(filterPaySystemFromSelectProductPageStateProvider)
        : ref.watch(filterPaySystemFromHomePageStateProvider);
    final eventRepo = ref.read(bankProductsRepositoryProvider);
    if (filterBanks.isNotEmpty) {
      arg.banks?.clear();
      for (int i = 0; i < filterBanks.length; i++) {

        arg.banks?.add(filterBanks[i]);
      }
    } else {
      arg.banks?.clear();
    }
    if (filterCashBack.isNotEmpty) {
      arg.cashBack?.clear();
      for (int i = 0; i < filterCashBack.length; i++) {
if(!filterCashBack.contains('Не важно')){
        arg.cashBack?.add(filterCashBack[i]);}
      }
    } else {
      arg.cashBack?.clear();
    }
    if (filterPaySystem.isNotEmpty) {
      arg.paySystem?.clear();
      for (int i = 0; i < filterPaySystem.length; i++) {
        if(!filterPaySystem.contains('Любая')){
        arg.paySystem?.add(filterPaySystem[i]);}
      }
    } else {
      arg.paySystem?.clear();
    }

    return await eventRepo.fetch(arg, ref);
  }
}

final bankProductsControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    BankProductsController, List<ListProductModel>, FiltersModel>(
  BankProductsController.new,
);
