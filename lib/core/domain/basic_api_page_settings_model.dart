import 'bank_products_model/bank_products_model.dart';
import 'filters_model.dart';

class BasicApiPageSettingsModel {
  final BankDetailsModel? bankDetailsModel;
  final String? productTypeUrl;
  final String? pageName;
  final String? productId;
  final String? whereFrom;
  final FiltersModel? filtersModel;

  /// модель которая используется для передачи параметров между экранами и в апишки
  BasicApiPageSettingsModel({
    this.bankDetailsModel,
    this.productTypeUrl,
    this.pageName,
    this.productId,
    this.filtersModel,
    this.whereFrom,
  });
}
