import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/core/domain/rko_model/rko_model.dart';
import 'package:podberi_ru/features/details_page/debit_cards/presentation/debit_cards_controller.dart';

import 'rko_details_data_source.dart';


abstract class RkoDetailsRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref);
}

class RkoDetailsRepository implements RkoDetailsRepositoryImpl {
  RkoDetailsRepository();

  @override
  Future<ListRkoModel> fetch(
      BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<RkoDetailsGetDataSource>()
        .fetch(detailsParameters.productTypeUrl!, detailsParameters.productId!);
    return response;
  }
}
///репозиторий для получения деталей о выбранном рко
///вызывается из [debitCardsDetailsControllerProvider]
final rkoDetailsRepositoryProvider =
    Provider.autoDispose<RkoDetailsRepository>((ref) {
  final fetch = RkoDetailsRepository();
  return fetch;
});
