import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'bank_products_data_source.dart';

///repository for fetch bank products
abstract class BankProductsRepositoryImpl {
  Future<void> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class BankProductsRepository implements BankProductsRepositoryImpl {
  BankProductsRepository();
  @override
  Future<List<ListProductModel>> fetch(String arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///select product type for instance in api (debit_card, credit_card, zaymi, rko)
    String productType ='';
    switch (arg) {
      case "selectProductPage":
        productType = ref.watch(productTypeUrlFromCatalogStateProvider);

        break;
      case "homePage":
        productType = ref.watch(productTypeUrlFromHomeStateProvider);

        break;
      case "allBanksPage":
        productType = 'debit_cards';

        break;
      case "Дебетовые карты":
        productType = 'debit_cards';

        break;
      case "Кредитные карты":
        productType = 'credit_cards';

        break;
    }
    final response = await GetIt.I<BankProductsGetDataSource>().fetch(productType);
    return response;
  }
}

final bankProductsRepositoryProvider =
Provider.autoDispose<BankProductsRepository>((ref) {

  final fetch = BankProductsRepository();
  return fetch;
});