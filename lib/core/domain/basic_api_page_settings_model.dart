import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';

import 'filters_model.dart';
///модель передается между экранами и также передается в провайдеры
///возможно доудйт руки до того чтобы переписать эту логику
///и разделить хотябы на две модели (одну для страниц, другую для провайдеров)
///здесь обязательным параметром является FiltersModel, но она передается пустой,
///так как фильтры применяются только на странице фильтров и затем после выхода из
///каталога очищаются
class BasicApiPageSettingsModel {
  BasicApiPageSettingsModel({
    this.bankDetailsModel,
    this.productTypeUrl,
    this.pageName,
    this.productId,
    this.whereFrom,
    required this.page,
    required this.filters,
  });

  final BankListDetailsModel? bankDetailsModel;
  String? productTypeUrl;
  final String? pageName;
  final String? productId;
  final String? whereFrom;
  FiltersModel filters = FiltersModel();
  int? page;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BasicApiPageSettingsModel &&
        other.bankDetailsModel == bankDetailsModel &&
        other.productTypeUrl == productTypeUrl &&
        other.pageName == pageName &&
        other.productId == productId &&
        other.whereFrom == whereFrom &&
        other.page == page &&
        other.filters == filters;
  }

  @override
  int get hashCode =>
      bankDetailsModel.hashCode ^
      productTypeUrl.hashCode ^
      pageName.hashCode ^
      productId.hashCode ^
      whereFrom.hashCode ^
      page.hashCode ^
      filters.hashCode;
}
