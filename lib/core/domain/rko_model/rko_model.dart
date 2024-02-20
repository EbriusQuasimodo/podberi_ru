// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';

part 'rko_model.g.dart';

part 'rko_model.freezed.dart';

@freezed
class RkoModel with _$RkoModel {
  factory RkoModel({
    @Default([]) @JsonKey(name: 'items') List<ListRkoModel> items,
    @Default(0) @JsonKey(name: 'items_count') int itemsCount,
  }) = _RkoModel;

  factory RkoModel.fromJson(Map<String, Object?> json) =>
      _$RkoModelFromJson(json);
}

@freezed
class ListRkoModel with _$ListRkoModel {
  factory ListRkoModel({
    @Default('') @JsonKey(name: '_id') String id,
    @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
    @JsonKey(name: 'oper_day_here') RkoOperDateModel? operDayHere,
    @JsonKey(name: 'oper_day_there') RkoOperDateModel? operDayThere,
    @Default('') @JsonKey(name: 'bank_name') String bankName,
    @Default(false) bool best,
    @Default(false) bool enable,
    @Default([]) List<String> features,
    @Default(false) @JsonKey(name: 'for_ip') bool forIp,
    @Default(false) @JsonKey(name: 'for_ooo') bool forOoo,
    @Default(0) @JsonKey(name: 'min_eq') int minEq,
    @Default(false) @JsonKey(name: 'opening_online') bool openingOnline,
    @Default(false) bool popular,
    @Default(0) @JsonKey(name: 'price_open') int priceOpen,
    @Default(0) @JsonKey(name: 'rateNumber') int rateNumber,
    List<RkoRatesListModel>? rates,
    @Default('') @JsonKey(name: 'ratesName') String ratesName,
    @Default('') @JsonKey(name: 'ref_link') String refLink,
    @Default('') String slug,
  }) = _ListRkoModel;

  factory ListRkoModel.fromJson(Map<String, Object?> json) =>
      _$ListRkoModelFromJson(json);
}


@freezed
class RkoOperDateModel with _$RkoOperDateModel {
  factory RkoOperDateModel({
    @Default('')  String from,
    @Default('')  String to,

  }) = _RkoOperDateModel;

  factory RkoOperDateModel.fromJson(Map<String, Object?> json) =>
      _$RkoOperDateModelFromJson(json);
}

@freezed
class RkoRatesListModel with _$RkoRatesListModel {
  factory RkoRatesListModel({
    @Default('') @JsonKey(name: 'all_conditions_link') String allConditionsLink,
    @Default(false) bool credits,
    @Default('') @JsonKey(name: 'credits_text') String creditsText,
    @Default(false) bool deposits,
    @Default('') @JsonKey(name: 'deposits_text') String depositsText,
    @JsonKey(name: 'descriptions') RkoRatesDescriptionsModel? descriptions,
    @Default('') @JsonKey(name: 'free_transfers_ur') String freeTransfersUr,
    @Default(false) bool government,
    @Default(false) @JsonKey(
        name: 'interest_on_balance') bool interestOnBalance,
    @Default(0) dynamic main,
    @Default('') String name,
    @Default(false) @JsonKey(name: 'online_accounting') bool onlineAccounting,
    @Default(0) @JsonKey(name: 'price_transfers_ur') int priceTransfersUr,
    @Default(0) @JsonKey(name: 'service_1_month') dynamic service1Month,
    @Default(0) @JsonKey(name: 'service_1_year') dynamic service1Year,
    @Default(0) @JsonKey(name: 'service_3_month') dynamic service3Month,
    @Default(0) @JsonKey(name: 'service_6_month') dynamic service6Month,
    @Default(0) @JsonKey(name: 'service_forever') dynamic serviceForever,

  }) = _RkoRatesListModel;

  factory RkoRatesListModel.fromJson(Map<String, Object?> json) =>
      _$RkoRatesListModelFromJson(json);
}

@freezed
class RkoRatesDescriptionsModel with _$RkoRatesDescriptionsModel {
  factory RkoRatesDescriptionsModel({
    @Default('') @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
    @Default('') @JsonKey(
        name: 'transfer_commission') String transferCommission,
    @Default('') @JsonKey(
        name: 'stocks') String stocks,
    @Default('') @JsonKey(
        name: 'deposit_cash') String depositCash,

  }) = _RkoRatesDescriptionsModel;

  factory RkoRatesDescriptionsModel.fromJson(Map<String, Object?> json) =>
      _$RkoRatesDescriptionsModelFromJson(json);
}