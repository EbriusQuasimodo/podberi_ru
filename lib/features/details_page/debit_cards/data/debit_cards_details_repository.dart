import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_controller.dart';

import '../../debit_cards/data/debit_cards_details_data_source.dart';


abstract class DebitCardsDetailsRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref);
}

class DebitCardsDetailsRepository implements DebitCardsDetailsRepositoryImpl {
  DebitCardsDetailsRepository();

  @override
  Future<ListDebitCardsModel> fetch(
      BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<DebitCardsDetailsGetDataSource>()
        .fetch(detailsParameters.productTypeUrl!, detailsParameters.productId!);
    return response;
  }
}
///репозиторий для получения деталей о выбранной дебетовке
///вызывается из [debitCardsDetailsControllerProvider]
final debitCardsDetailsRepositoryProvider =
    Provider.autoDispose<DebitCardsDetailsRepository>((ref) {
  final fetch = DebitCardsDetailsRepository();
  return fetch;
});
