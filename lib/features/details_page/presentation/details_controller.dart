import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/details_page/data/product_details_repository.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class ProductDetailsController extends AutoDisposeFamilyAsyncNotifier<List<ListProductModel>, BasicApiPageSettingsModel> {
  ProductDetailsController();
  @override
  FutureOr<List<ListProductModel>> build(BasicApiPageSettingsModel arg) async {
    final eventRepo = ref.read(productDetailsRepositoryProvider);
    return await eventRepo.fetch(arg, ref);
  }

  fetchProductDetailsData() async {
    state = const AsyncLoading();
    final eventRepo = ref.read(productDetailsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      return await eventRepo.fetch(arg, ref);
    });
  }
}

///контроллер для получения данных о деталях банковского продукта,
///используется в [DetailsPage]
final productDetailsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<ProductDetailsController, List<ListProductModel>, BasicApiPageSettingsModel>(
  ProductDetailsController.new,
);

