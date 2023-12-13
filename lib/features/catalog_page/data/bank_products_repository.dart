
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/filters_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'bank_products_data_source.dart';

///repository for fetch bank products
abstract class BankProductsRepositoryImpl {
  Future<void> fetch(FiltersModel arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class BankProductsRepository implements BankProductsRepositoryImpl {
  BankProductsRepository();
  @override
  Future<List<ListProductModel>> fetch(FiltersModel arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///select product type for instance in api (debit_card, credit_card, zaymi, rko)
    String productType ='';
    switch (arg.productType) {
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
      case 'homePageBanks':
        productType = 'debit_cards';
        break;
    }
    if(arg.banks!.isNotEmpty ||arg.cashBack!.isNotEmpty||arg.paySystem!.isNotEmpty) {
      productType += '?';

      if (arg.banks!.isNotEmpty) {
        for (int i = 0; i < arg.banks!.length; i++) {
          productType += 'bank_details.bank_name=${arg.banks?[i]}&';
        }
      }
      if (arg.cashBack!.isNotEmpty) {

        for (int i = 0; i < arg.cashBack!.length; i++) {
          productType += 'bonus_format=${arg.cashBack?[i]}&';
        }
      }
      if (arg.paySystem!.isNotEmpty) {

        for (int i = 0; i < arg.paySystem!.length; i++) {
          productType += 'pay_system=${arg.paySystem?[i]}&';
        }
      }
     // productType.substring(0, productType.length -1);
    }
    print(productType);
    final response = await GetIt.I<BankProductsGetDataSource>().fetch(productType);
    return response;

  }
}

final bankProductsRepositoryProvider =
Provider.autoDispose<BankProductsRepository>((ref) {

  final fetch = BankProductsRepository();
  return fetch;
});