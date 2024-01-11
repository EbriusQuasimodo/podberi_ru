import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/details_page/presentation/controllers/debit_cards_controller.dart';

import 'zaimy_details_data_source.dart';


abstract class ZaimyDetailsRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref);
}

class ZaimyDetailsRepository implements ZaimyDetailsRepositoryImpl {
  ZaimyDetailsRepository();

  @override
  Future<List<ListZaimyModel>> fetch(
      BasicApiPageSettingsModel detailsParameters,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    final response = await GetIt.I<ZaimyDetailsGetDataSource>()
        .fetch(detailsParameters.productTypeUrl!, detailsParameters.productId!);
    return response;
  }
}
///репозиторий для получения деталей о выбранном займе
///вызывается из [zaimyDetailsControllerProvider]
final zaimyDetailsRepositoryProvider =
    Provider.autoDispose<ZaimyDetailsRepository>((ref) {
  final fetch = ZaimyDetailsRepository();
  return fetch;
});
