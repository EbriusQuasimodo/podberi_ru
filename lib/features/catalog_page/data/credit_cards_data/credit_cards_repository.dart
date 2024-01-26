import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/credit_cards_model/credit_cards_model.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'credit_cards_data_source.dart';

abstract class CreditCardsRepositoryImpl {
  Future<void> fetch(
      BasicApiPageSettingsModel arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class CreditCardsRepository implements CreditCardsRepositoryImpl {
  CreditCardsRepository();

  @override
  Future<CreditCardsModel> fetch(BasicApiPageSettingsModel arg,
      AutoDisposeAsyncNotifierProviderRef ref) async {
    ///select product type for instance in api (debit_card, credit_card, zaymi, rko)
    String productType = arg.productTypeUrl!;
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
    if (arg.filtersModel!.noPercentPeriod != '') {
      ///ищем где беспроцентный период больше или равен выбранному в фильтрах
      productType +=
          '&no_percent_period%24gte=${arg.filtersModel?.noPercentPeriod}';
    }
    if (arg.filtersModel!.percents != 0) {
      ///ищем кредитки у которых макс процент находится в диапазоне min - max
      productType += '&min_percent%24lte=${arg.filtersModel!.percents}&max_percent%24gte=${arg.filtersModel!.percents}';

    }
    if (arg.filtersModel!.features !=null) {
      for (int i = 0; i < arg.filtersModel!.features!.length; i++) {
        productType += '&features=${arg.filtersModel?.features?[i]}';
      }
    }
    if (arg.filtersModel!.creditLimit !=0) {

        productType += '&credit_limit%24gte=${arg.filtersModel?.creditLimit}';

    }
    if (arg.filtersModel!.sort !='') {

      productType += '&sort\$${arg.filtersModel!.sort}';

    }
    final response =
        await GetIt.I<CreditCardsGetDataSource>().fetch(productType);

    return response;
  }
}

///репозиторий для получения кредиток здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [creditCardsControllerProvider]
final creditCardsRepositoryProvider =
    Provider.autoDispose<CreditCardsRepository>((ref) {
  final fetch = CreditCardsRepository();
  return fetch;
});
