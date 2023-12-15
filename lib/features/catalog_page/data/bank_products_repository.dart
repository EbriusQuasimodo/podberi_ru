
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'bank_products_data_source.dart';


abstract class BankProductsRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class BankProductsRepository implements BankProductsRepositoryImpl {
  BankProductsRepository();
  @override
  Future<List<ListProductModel>> fetch(BasicApiPageSettingsModel arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///select product type for instance in api (debit_card, credit_card, zaymi, rko)
    String productType =arg.productTypeUrl!;
    switch (arg.whereFrom) {
      case "allBanksPage":
        productType = ref.watch(productTypeUrlFromAllBanksStateProvider);

        break;
      case 'homePageBanks':
        productType = ref.watch(productTypeUrlFromHomeBanksStateProvider);
        break;
    }
    ///добваление фильтров в productType
    if(arg.filtersModel!.banks!.isNotEmpty ||arg.filtersModel!.cashBack!.isNotEmpty||arg.filtersModel!.paySystem!.isNotEmpty) {
      productType += '?';
      if (arg.filtersModel!.banks!.isNotEmpty) {
        for (int i = 0; i < arg.filtersModel!.banks!.length; i++) {
          productType += 'bank_details.bank_name=${arg.filtersModel?.banks?[i]}&';
        }
      }
      if (arg.filtersModel!.cashBack!.isNotEmpty) {

        for (int i = 0; i < arg.filtersModel!.cashBack!.length; i++) {
          productType += 'bonus_format=${arg.filtersModel?.cashBack?[i]}&';
        }
      }
      if (arg.filtersModel!.paySystem!.isNotEmpty) {

        for (int i = 0; i < arg.filtersModel!.paySystem!.length; i++) {
          productType += 'pay_system=${arg.filtersModel?.paySystem?[i]}&';
        }
      }
    }
    final response = await GetIt.I<BankProductsGetDataSource>().fetch(productType);
    return response;

  }
}
///репозиторий для получения всех банковских продуктов здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [bankProductsControllerProvider]
final bankProductsRepositoryProvider =
Provider.autoDispose<BankProductsRepository>((ref) {

  final fetch = BankProductsRepository();
  return fetch;
});