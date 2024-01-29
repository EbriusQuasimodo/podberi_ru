import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/details_page/credit_cards/data/credit_cards_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class CreditCardsDetailsController extends AutoDisposeFamilyAsyncNotifier<ListCreditCardsModel, BasicApiPageSettingsModel> {
 CreditCardsDetailsController();
  @override
  FutureOr<ListCreditCardsModel> build(BasicApiPageSettingsModel arg) async {
    final repoCreditCardsDetails = ref.read(creditCardsDetailsRepositoryProvider);
    return await repoCreditCardsDetails.fetch(arg, ref);
  }
}

///контроллер для получения данных о деталях кредитки,
///используется в [LoadDetailsPageByProductType]
final creditCardsDetailsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<CreditCardsDetailsController, ListCreditCardsModel, BasicApiPageSettingsModel>(
  CreditCardsDetailsController.new,
);
