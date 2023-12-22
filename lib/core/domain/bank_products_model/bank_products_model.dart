import 'package:freezed_annotation/freezed_annotation.dart';
// ignore_for_file: invalid_annotation_target

part 'bank_products_model.g.dart';

part 'bank_products_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default([]) @JsonKey(name: 'items') List<ListProductModel> items,
    @Default(0) @JsonKey(name: 'items_count') int itemsCount,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ListProductModel with _$ListProductModel {
  factory ListProductModel({
    @Default('') @JsonKey(name: 'OGRN') dynamic ogrn,
    @Default(0) @JsonKey(name: 'SMS_max') dynamic smsMax,
    @Default(0) @JsonKey(name: 'SMS_min') dynamic smsMin,
    @Default('') @JsonKey(name: '_id') dynamic id,
    @Default('') @JsonKey(name: 'accrual_of_bonuses') dynamic accrualOfBonuses,
    @Default('') @JsonKey(name: 'age_max') dynamic ageMax,
    @Default('') @JsonKey(name: 'age_min') dynamic ageMin,
    @JsonKey(name: 'bank_details') BankDetailsModel? bankDetails,
    @Default(false) @JsonKey(name: 'best_offer') dynamic bestOffer,
    @Default('') @JsonKey(name: 'bonus_format') dynamic bonusFormat,
    @Default('') @JsonKey(name: 'bonus_program') dynamic bonusProgram,
    @Default(false) @JsonKey(name: 'can_be_published') dynamic canBePublished,
    @Default(false) @JsonKey(name: 'card_delievery') dynamic cardDelievery,
    @Default('') @JsonKey(name: 'card_issuance') dynamic cardIssuance,
    @Default('')
    @JsonKey(name: 'card_issuer_requirements')
    dynamic cardIssuerRequirements,
    @Default('') @JsonKey(name: 'card_name') dynamic cardName,
    @Default('') @JsonKey(name: 'cash_withdrawal') dynamic cashWithdrawal,
    @Default('')
    @JsonKey(name: 'cash_withdrawal_limit')
    dynamic cashWithdrawalLimit,
    @Default('') dynamic cashback,
    @Default('') @JsonKey(name: 'currency_cards') dynamic currencyCard,
    @Default('') dynamic discounts,
    @Default([]) @JsonKey(name: 'features') List<dynamic> features,
    @Default(false) @JsonKey(name: 'for_kids') dynamic forKids,
    @Default(false)
    @JsonKey(name: 'free_withdrawal_in_foreign_banks')
    dynamic freeWithdrawalInForeignBanks,
    @Default(false) dynamic hit,
    @Default('') dynamic image,
    @Default('') @JsonKey(name: 'juridical_adress') dynamic juridicalAdress,
    @Default('') @JsonKey(name: 'juridical_name') dynamic juridicalName,
    @Default('') dynamic license,
    @Default(0) @JsonKey(name: 'max_cashback') dynamic maxCashback,
    @Default('') @JsonKey(name: 'min_link') dynamic minLink,
    @Default(0) @JsonKey(name: 'offer_payout') dynamic offerPayout,
    @Default(false) dynamic overdraft,
    @Default('') @JsonKey(name: 'pay_system') dynamic pauSystem,
    @Default('') dynamic payments,
    @Default('')
    @JsonKey(name: 'percent_calculation')
    dynamic percentCalculation,
    @Default(0.0) @JsonKey(name: 'percent_of_rest') dynamic percentOfRest,
    @Default('') dynamic phone,
    @Default('') dynamic picture,
    @Default('') @JsonKey(name: 'plug-in_options ') dynamic plugInOptions,
    @Default('') dynamic service,
    @Default(0)
    @JsonKey(name: 'service_max_per_month')
    dynamic serviceMaxPerMonth,
    @Default(0) @JsonKey(name: 'service_min') dynamic serviceMin,
    @Default('') dynamic site,
    @Default('') dynamic support,
    @Default('') @JsonKey(name: 'tariff_document') dynamic tariffDocument,
    @Default('') dynamic total,
    @Default('') dynamic transfers,
    @Default(false) @JsonKey(name: 'under_18') dynamic under18,
    @Default('') @JsonKey(name: 'way_to_get_card') dynamic wayToGetCard,
  }) = _ListProductModel;

  factory ListProductModel.fromJson(Map<String, Object?> json) =>
      _$ListProductModelFromJson(json);
}

@freezed
class BankDetailsModel with _$BankDetailsModel {
  factory BankDetailsModel({
    @Default('') @JsonKey(name: '_id') dynamic id,
    @Default('') @JsonKey(name: 'bank_name') dynamic bankName,
    @Default('') dynamic color,
    @Default('') dynamic picture,
  }) = _BankDetailsModel;

  factory BankDetailsModel.fromJson(Map<String, Object?> json) =>
      _$BankDetailsModelFromJson(json);
}
