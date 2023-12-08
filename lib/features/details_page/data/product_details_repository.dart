import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/catalog_controller.dart';
import 'package:podberi_ru/features/details_page/domain/details_parameters_model.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'product_details_data_source.dart';

///repository for fetch bank product details
abstract class ProductDetailsRepositoryImpl {
  Future<void> fetch(DetailsParameters detailsParameters,AutoDisposeAsyncNotifierProviderRef ref);
}

class ProductDetailsRepository implements ProductDetailsRepositoryImpl {
  ProductDetailsRepository();

  @override
  Future<List<ListProductModel>> fetch(DetailsParameters detailsParameters, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///select product type for instance in api (debit_card, credit_card, zaymi, rko)
    String productType ='';
    switch (detailsParameters.productType) {
      case "selectProductPage":
        productType = ref.watch(productTypeUrlFromCatalogStateProvider);

        break;
      case "homePage":
        productType = ref.watch(productTypeUrlFromHomeStateProvider);

        break;
      case "allBanksPage":
        productType = 'debit_cards';

        break;
    }
    final response = await GetIt.I<ProductDetailsGetDataSource>()
        .fetch(productType, detailsParameters.id);
    return response;
  }
}

final productDetailsRepositoryProvider =
Provider.autoDispose<ProductDetailsRepository>((ref) {

  final fetch = ProductDetailsRepository();
  return fetch;
});