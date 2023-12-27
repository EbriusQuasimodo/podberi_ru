// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';

part 'credit_cards_model.g.dart';

part 'credit_cards_model.freezed.dart';

@freezed
class CreditCardsModel with _$CreditCardsModel {
  factory CreditCardsModel({
    @Default([]) @JsonKey(name: 'items') List<ListCreditCardsModel> items,
    @Default(0) @JsonKey(name: 'items_count') int itemsCount,
  }) = _CreditCardsModel;

  factory CreditCardsModel.fromJson(Map<String, Object?> json) =>
      _$CreditCardsModelFromJson(json);
}

@freezed
class ListCreditCardsModel with _$ListCreditCardsModel {
  factory ListCreditCardsModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'all_conditions_link') String allConditionsLink,
    @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
    @Default('') @JsonKey(name: 'bank_name') String bankName,
    @Default(false) bool best,
    @Default('') @JsonKey(name: 'cashback_format') String cashbackFormat,
    @Default(false) @JsonKey(name: 'citizenship_russia') bool citizenshipRussia,
    CreditCardsConditionsModel? conditions,
    @Default(0) @JsonKey(name: 'credit_limit')int creditLimit,
    @Default([]) @JsonKey(name: 'credit_rates')List<String> creditRates,
    @Default(false) bool delivery,
    CreditCardsDescriptionsModel? descriptions,
    @Default(false) bool enable,
    @Default([]) List<String> features,
    @Default('') String image,
    @Default(0) int issue,
    @Default(0) @JsonKey(name: 'max_age') int maxAge,
    @Default('') @JsonKey(name: 'max_cashback') String maxCashBack,
    @Default(0) @JsonKey(name: 'max_cashback_percent') int maxCashbackPercent,
    @Default(0) @JsonKey(name: 'max_percent') double maxPercent,
    @Default(0) @JsonKey(name: 'max_service') int maxService,
    @Default(0) @JsonKey(name: 'max_sms') int maxSms,
    @Default(0) @JsonKey(name: 'min_age') int minAge,
    @Default(0) @JsonKey(name: 'min_income') int minIncome,
    @Default(0) @JsonKey(name: 'min_percent') double minPercent,
    @Default(0) @JsonKey(name: 'min_service') int minService,
    @Default(0) @JsonKey(name: 'min_sms') int minSms,
    @Default('') String name,
    @Default(0) @JsonKey(name: 'no_percent_period') int noPercentPeriod,
    @Default('') @JsonKey(name: 'payment_system') String paymentSystem,
    @Default(false) bool popular,
    @Default('') @JsonKey(name: 'ref_link') String refLink,
    @Default(false) @JsonKey(name: 'reg_russia') bool regRussia,
    @Default(0) int reissue,
    @Default('') String slug,
    @Default(false) @JsonKey(name: 'with_refinancing') bool withRefinancing,
    @Default('') @JsonKey(name: 'work_exp') String workExp,
  }) = _ListCreditCardsModel;

  factory ListCreditCardsModel.fromJson(Map<String, Object?> json) =>
      _$ListCreditCardsModelFromJson(json);
}

@freezed
class CreditCardsConditionsModel with _$CreditCardsConditionsModel {
  factory CreditCardsConditionsModel({
    @Default('') @JsonKey(name: 'add_requirements') String addRequirements,
    @Default('') @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
    @Default('') String cashback,
    @Default('') String stocks,
  }) = _CreditCardsConditionsModel;

  factory CreditCardsConditionsModel.fromJson(Map<String, Object?> json) =>
      _$CreditCardsConditionsModelFromJson(json);
}

@freezed
class CreditCardsDescriptionsModel with _$CreditCardsDescriptionsModel {
  factory CreditCardsDescriptionsModel({
    @Default('') @JsonKey(name: 'add_services') String addServices,
    @Default('') @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
    @Default('') String execution,
    @Default('') @JsonKey(name: 'no_percent') String noPercent,
    @Default('') String rates,
    @Default('') String refinancing,
    @Default('') String result,
    @Default('') String transfers,
  }) = _CreditCardsDescriptionsModel;

  factory CreditCardsDescriptionsModel.fromJson(Map<String, Object?> json) =>
      _$CreditCardsDescriptionsModelFromJson(json);
}
