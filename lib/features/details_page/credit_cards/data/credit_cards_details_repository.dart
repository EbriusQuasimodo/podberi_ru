import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';

import 'credit_cards_details_data_source.dart';


abstract class CreditCardsDetailsRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref);
}

class CreditCardsDetailsRepository implements CreditCardsDetailsRepositoryImpl {
  CreditCardsDetailsRepository();

  @override
  Future<ListCreditCardsModel> fetch(
      BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<CreditCardsDetailsGetDataSource>()
        .fetch(detailsParameters.productTypeUrl!, detailsParameters.productId!);
    return response;
  }
}
///репозиторий для получения деталей о выбранной кредитке
///вызывается из [creditCardsDetailsControllerProvider]
final creditCardsDetailsRepositoryProvider =
    Provider.autoDispose<CreditCardsDetailsRepository>((ref) {
  final fetch = CreditCardsDetailsRepository();
  return fetch;
});
