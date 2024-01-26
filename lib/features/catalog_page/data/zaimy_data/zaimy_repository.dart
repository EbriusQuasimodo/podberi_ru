import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:podberi_ru/core/domain/basic_api_page_settings_model.dart';
import 'package:podberi_ru/features/all_banks_page/presentation/all_banks_controller.dart';
import 'package:podberi_ru/features/catalog_page/domain/zaimy_model/zaimy_model.dart';
import 'package:podberi_ru/features/home_page/presentation/home_page_controller.dart';

import 'zaimy_data_source.dart';

abstract class ZaimyRepositoryImpl {
  Future<void> fetch(BasicApiPageSettingsModel arg, AutoDisposeAsyncNotifierProviderRef ref);
}

class ZaimyRepository implements ZaimyRepositoryImpl {
  ZaimyRepository();
  @override
  Future<ZaimyModel> fetch(BasicApiPageSettingsModel arg, AutoDisposeAsyncNotifierProviderRef ref) async {
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
    if (arg.filtersModel!.term != '') {
      ///ищем где срок займа больше или равен выбранному в фильтрах
      productType +=
      '&min_term%24lte=${arg.filtersModel?.term}&max_term%24gte=${arg.filtersModel?.term}';
    }
    if (arg.filtersModel!.percents != 0) {
      ///ищем займы у которых макс процент находится в диапазоне min - max
      productType += '&min_percent%24lte=${arg.filtersModel!.percents}&max_percent%24gte=${arg.filtersModel!.percents}';

    }

    if (arg.filtersModel!.sum !=0) {

      productType += '&sum%24gte=${arg.filtersModel?.sum}';

    }
    if (arg.filtersModel!.sort !='') {

      productType += '&sort\$${arg.filtersModel!.sort}';

    }
    final response = await GetIt.I<ZaimyGetDataSource>().fetch(productType);

    return response;

  }
}
///репозиторий для получения всех банковских продуктов здесь формируется uri для запроса (productType),
///он наполняется типом продукта и фильтрами
///вызывается из [zaimyControllerProvider]
final zaimyRepositoryProvider =
Provider.autoDispose<ZaimyRepository>((ref) {

final fetch = ZaimyRepository();
return fetch;
});