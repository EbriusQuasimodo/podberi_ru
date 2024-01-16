import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';

import 'filters_model.dart';

class BasicApiPageSettingsModel {
  final BankListDetailsModel? bankDetailsModel;
  String? productTypeUrl;
  final String? pageName;
  final String? productId;
  final String? whereFrom;

  final FiltersModel? filtersModel;
  String? page;

  /// модель которая используется для передачи параметров между экранами и в апишки
  BasicApiPageSettingsModel({
    this.bankDetailsModel,
    this.productTypeUrl,
    this.pageName,
    this.productId,
    this.filtersModel,
    this.whereFrom,
    this.page,
  });
}
