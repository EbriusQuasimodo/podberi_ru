import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/features/catalog_page/data/bank_products_repository.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_page.dart';
import 'package:podberi_ru/features/catalog_page/presentation/select_product_type_page.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

///product type title which select on [SelectProductTypePage] used for title in [CatalogPage]
final productTypeTitleFromCatalogStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
///product type url which select on [SelectProductTypePage] used for instance in api
final productTypeUrlFromCatalogStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

///bank products controller. used for fetch list of products. have required params (product type) which used in [BankProductsRepository]
class BankProductsController extends AutoDisposeFamilyAsyncNotifier<List<ListProductModel>, String> {
  BankProductsController();
String productType = '';
  @override
  FutureOr<List<ListProductModel>> build(String arg) async {
    final eventRepo = ref.read(bankProductsRepositoryProvider);
    return await eventRepo.fetch(arg, ref);
  }

  fetchBankProductsData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(bankProductsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch(arg, ref);
    });
  }
}

final bankProductsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<BankProductsController, List<ListProductModel>, String>(
  BankProductsController.new,
);

