import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/bank_products_model/bank_products_model.dart';
import 'package:podberi_ru/features/details_page/data/product_details_repository.dart';
import 'package:podberi_ru/features/details_page/domain/details_parameters_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

///bank products details controller. used for fetch product by id. have required params (product type, id) which used in [ProductDetailsRepository]
class ProductDetailsController extends AutoDisposeFamilyAsyncNotifier<List<ListProductModel>, DetailsParameters> {
  ProductDetailsController();
  @override
  FutureOr<List<ListProductModel>> build(DetailsParameters arg) async {
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

final productDetailsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<ProductDetailsController, List<ListProductModel>, DetailsParameters>(
  ProductDetailsController.new,
);

