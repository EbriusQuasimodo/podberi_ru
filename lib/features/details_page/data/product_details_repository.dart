import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/details_page/presentation/details_controller.dart';

import 'product_details_data_source.dart';


abstract class ProductDetailsRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref);
}

class ProductDetailsRepository implements ProductDetailsRepositoryImpl {
  ProductDetailsRepository();

  @override
  Future<List<ListProductModel>> fetch(
      BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<ProductDetailsGetDataSource>()
        .fetch(detailsParameters.productTypeUrl!, detailsParameters.productId!);
    return response;
  }
}
///репозиторий для получения деталей о выбранном банковском продукте
///вызывается из [productDetailsControllerProvider]
final productDetailsRepositoryProvider =
    Provider.autoDispose<ProductDetailsRepository>((ref) {
  final fetch = ProductDetailsRepository();
  return fetch;
});
