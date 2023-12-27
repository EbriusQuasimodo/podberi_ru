import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/data/product_details_repository.dart';
import 'package:podberi_ru/features/details_page/presentation/details_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class ProductDetailsController extends AutoDisposeFamilyAsyncNotifier<List<ListDebitCardsModel>, BasicApiPageSettingsModel> {
  ProductDetailsController();
  @override
  FutureOr<List<ListDebitCardsModel>> build(BasicApiPageSettingsModel arg) async {
    final eventRepo = ref.read(productDetailsRepositoryProvider);
    return await eventRepo.fetch(arg, ref);
  }
}

///контроллер для получения данных о деталях банковского продукта,
///используется в [DetailsPage]
final productDetailsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<ProductDetailsController, List<ListDebitCardsModel>, BasicApiPageSettingsModel>(
  ProductDetailsController.new,
);

