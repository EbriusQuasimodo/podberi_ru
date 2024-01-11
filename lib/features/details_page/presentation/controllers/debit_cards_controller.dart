import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/data/debit_cards/debit_cards_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class DebitCardsDetailsController extends AutoDisposeFamilyAsyncNotifier<List<ListDebitCardsModel>, BasicApiPageSettingsModel> {
  DebitCardsDetailsController();
  @override
  FutureOr<List<ListDebitCardsModel>> build(BasicApiPageSettingsModel arg) async {
    final eventRepo = ref.read(debitCardsDetailsRepositoryProvider);
    return await eventRepo.fetch(arg, ref);
  }
}

///контроллер для получения данных о деталях дебетовки,
///используется в [LoadDetailsPageByProductType]
final debitCardsDetailsControllerProvider =
AutoDisposeAsyncNotifierProvider.family<DebitCardsDetailsController, List<ListDebitCardsModel>, BasicApiPageSettingsModel>(
  DebitCardsDetailsController.new,
);

