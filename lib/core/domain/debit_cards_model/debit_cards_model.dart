// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podberi_ru/core/domain/bank_details_model/bank_details_model.dart';

part 'debit_cards_model.g.dart';

part 'debit_cards_model.freezed.dart';

@freezed
class DebitCardsModel with _$DebitCardsModel {
  factory DebitCardsModel({
    @Default([]) @JsonKey(name: 'items') List<ListDebitCardsModel> items,
    @Default(0) @JsonKey(name: 'items_count') int itemsCount,
  }) = _DebitCardsModel;

  factory DebitCardsModel.fromJson(Map<String, Object?> json) =>
      _$DebitCardsModelFromJson(json);
}

@freezed
class ListDebitCardsModel with _$ListDebitCardsModel {
  factory ListDebitCardsModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'all_conditions_link') String allConditionsLink,
    @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
    @Default('') @JsonKey(name: 'bank_name') String bankName,
    @Default(false) bool best,
    @Default(false) @JsonKey(name: 'cash_other_banks') bool cashOtherBanks,
    @Default('') @JsonKey(name: 'cashback_format') String cashbackFormat,
    @Default(false) @JsonKey(name: 'citizenship_russia') bool citizenshipRussia,
    DebitCardsConditionsModel? conditions,
    @Default('') String currencies,
    @Default(false) bool delivery,
    DebitCardsDescriptionsModel? descriptions,
    @Default(false) bool enable,
    @Default([]) List<String> features,
    @Default(false) @JsonKey(name: 'for_children') bool forChildren,
    @Default(false) @JsonKey(name: 'for_minors') bool forMinors,
    @Default('') String image,
    @Default('') @JsonKey(name: 'interest_on_balance') dynamic interestOnBalance,
    @Default(0) int issue,
    @Default(0) @JsonKey(name: 'max_age') int maxAge,
    @Default('') @JsonKey(name: 'max_cashback') String maxCashBack,
    @Default(0) @JsonKey(name: 'max_cashback_percent') int maxCashbackPercent,
    @Default(0) @JsonKey(name: 'max_service') dynamic maxService,
    @Default(0) @JsonKey(name: 'max_sms') int maxSms,
    @Default(0) @JsonKey(name: 'min_age') int minAge,
    @Default(0) @JsonKey(name: 'min_service') dynamic minService,
    @Default(0) @JsonKey(name: 'min_sms') int minSms,
    @Default('') String name,
    @Default(false) bool overdraft,
    @Default('') @JsonKey(name: 'payment_system') String paymentSystem,
    @Default(false) bool popular,
    @Default('') @JsonKey(name: 'ref_link') String refLink,
    @Default(false) @JsonKey(name: 'reg_russia') bool regRussia,
    @Default(0) int reissue,
    @Default('') String slug,
  }) = _ListDebitCardsModel;

  factory ListDebitCardsModel.fromJson(Map<String, Object?> json) =>
      _$ListDebitCardsModelFromJson(json);
}


@freezed
class DebitCardsConditionsModel with _$DebitCardsConditionsModel {
  factory DebitCardsConditionsModel({
    @Default('') @JsonKey(name: 'accrual_of_bonuses') String accrualOfBonuses,
    @Default('') @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
    @Default('') String stocks,
  }) = _DebitCardsConditionsModel;

  factory DebitCardsConditionsModel.fromJson(Map<String, Object?> json) =>
      _$DebitCardsConditionsModelFromJson(json);
}

@freezed
class DebitCardsDescriptionsModel with _$DebitCardsDescriptionsModel {
  factory DebitCardsDescriptionsModel({
    @Default('') @JsonKey(name: 'bonus_program') String bonusProgram,
    @Default('') @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
    @Default('')
    @JsonKey(name: 'connectable_options')
    String connectableOptions,
    @Default('') String execution,
    @Default('') @JsonKey(name: 'interest_calculation') String interestCalculation,
    @Default('') String result,
    @Default('') String service,
    @Default('') String stocks,
    @Default('') String support,
    @Default('') String transfers,
  }) = _DebitCardsDescriptionsModel;

  factory DebitCardsDescriptionsModel.fromJson(Map<String, Object?> json) =>
      _$DebitCardsDescriptionsModelFromJson(json);
}
