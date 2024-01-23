import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/debit_cards_model/debit_cards_model.dart';
import 'package:podberi_ru/features/catalog_page/presentation/controllers/debit_cards_controller.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'debit_cards_data_source.dart';

abstract class DebitCardsRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class DebitCardsRepository implements DebitCardsRepositoryImpl {
  DebitCardsRepository();
  @override
  Future<DebitCardsModel> fetch(BasicApiPageSettingsModel arg, AutoDisposeAsyncNotifierProviderRef ref) async {
    ///select product type for instance in api (debit_card, credit_card, zaymi, rko)
    String productType =arg.productTypeUrl!;
    switch (arg.whereFrom) {
      case "allBanksPage":
        productType = ref.read(productTypeUrlFromAllBanksStateProvider);

        break;
      case 'homePageBanks':
        productType = ref.read(productTypeUrlFromHomeBanksStateProvider);
        break;
    }
    productType += '?fetch=10&page=1';
    ///добваление фильтров в productType

      if (arg.filtersModel!.banks!.isNotEmpty) {
        for (int i = 0; i < arg.filtersModel!.banks!.length; i++) {
          productType += '&bank_details.bank_name=${arg.filtersModel?.banks?[i]}';
        }
      }
      // if (arg.filtersModel!.cashBack!.isNotEmpty) {
      //
      //   for (int i = 0; i < arg.filtersModel!.cashBack!.length; i++) {
      //     productType += '&bonus_format=${arg.filtersModel?.cashBack?[i]}';
      //   }
      // }
      if (arg.filtersModel!.paySystem!.isNotEmpty) {

        for (int i = 0; i < arg.filtersModel!.paySystem!.length; i++) {
          productType += '&payment_system=${arg.filtersModel?.paySystem?[i]}';
        }
      }
    if (arg.filtersModel!.features !=null) {
      for (int i = 0; i < arg.filtersModel!.features!.length; i++) {
        productType += '&features=${arg.filtersModel?.features?[i]}';
      }
    }

    final response = await GetIt.I<DebitCardsGetDataSource>().fetch(productType);

    return response;

  }
}
///репозиторий для получения всех банковских продуктов здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [debitCardsControllerProvider]
final debitCardsRepositoryProvider =
Provider.autoDispose<DebitCardsRepository>((ref) {

  final fetch = DebitCardsRepository();
  return fetch;
});