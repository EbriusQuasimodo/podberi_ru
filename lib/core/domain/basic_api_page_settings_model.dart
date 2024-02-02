import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';

import 'filters_model.dart';

class BasicApiPageSettingsModel {
  BasicApiPageSettingsModel({
    this.bankDetailsModel,
    this.productTypeUrl,
    this.pageName,
    this.productId,
    this.whereFrom,
    this.page = 1,
    this.banks,
    this.cashBack,
    this.paySystem,
    this.percents = 0,
    this.noPercentPeriod,
    this.features,
    this.term,
    this.sum,
    this.creditLimit,
    this.sort,
  });

  final BankListDetailsModel? bankDetailsModel;
  String? productTypeUrl;
  final String? pageName;
  final String? productId;
  final String? whereFrom;
  List<String>? banks;
  final List<String>? cashBack;
  List<String>? paySystem;
  List<String>? features = [];
  int percents = 0;
  String? noPercentPeriod;
  int? creditLimit;
  int? sum;
  String? term;
  String? sort;
  int? page = 1;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BasicApiPageSettingsModel &&
        other.bankDetailsModel == bankDetailsModel &&
        other.productTypeUrl == productTypeUrl &&
        other.pageName == pageName &&
        other.productId == productId &&
        other.whereFrom == whereFrom &&
        other.page == page;
    // &&
    // other.banks == banks &&
    // other.cashBack == cashBack &&
    // other.paySystem == paySystem &&
    // other.features == features &&
    // other.percents == percents &&
    // other.noPercentPeriod == noPercentPeriod &&
    // other.creditLimit == creditLimit &&
    // other.sum == sum &&
    // other.term == term &&
    // other.sort == sort;
  }

  @override
  int get hashCode =>
      bankDetailsModel.hashCode ^
      productTypeUrl.hashCode ^
      pageName.hashCode ^
      productId.hashCode ^
      whereFrom.hashCode ^
      page.hashCode;
      // ^
      // banks.hashCode ^
      // cashBack.hashCode ^
      // paySystem.hashCode ^
      // features.hashCode ^
      // percents.hashCode ^
      // noPercentPeriod.hashCode ^
      // creditLimit.hashCode ^
      // sum.hashCode ^
      // term.hashCode ^
      // sort.hashCode;
}
