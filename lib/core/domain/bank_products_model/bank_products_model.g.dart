// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ListProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemsCount: json['items_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'items_count': instance.itemsCount,
    };

_$ListProductModelImpl _$$ListProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListProductModelImpl(
      ogrn: json['OGRN'] ?? '',
      smsMax: json['SMS_max'] ?? 0,
      smsMin: json['SMS_min'] ?? 0,
      id: json['_id'] ?? '',
      accrualOfBonuses: json['accrual_of_bonuses'] ?? '',
      ageMax: json['age_max'] ?? '',
      ageMin: json['age_min'] ?? '',
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetailsModel.fromJson(
              json['bank_details'] as Map<String, dynamic>),
      bestOffer: json['best_offer'] ?? false,
      bonusFormat: json['bonus_format'] ?? '',
      bonusProgram: json['bonus_program'] ?? '',
      canBePublished: json['can_be_published'] ?? false,
      cardDelievery: json['card_delievery'] ?? false,
      cardIssuance: json['card_issuance'] ?? '',
      cardIssuerRequirements: json['card_issuer_requirements'] ?? '',
      cardName: json['card_name'] ?? '',
      cashWithdrawal: json['cash_withdrawal'] ?? '',
      cashWithdrawalLimit: json['cash_withdrawal_limit'] ?? '',
      cashback: json['cashback'] ?? '',
      currencyCard: json['currency_cards'] ?? '',
      discounts: json['discounts'] ?? '',
      features: json['features'] as List<dynamic>? ?? const [],
      forKids: json['for_kids'] ?? false,
      freeWithdrawalInForeignBanks:
          json['free_withdrawal_in_foreign_banks'] ?? false,
      hit: json['hit'] ?? false,
      image: json['image'] ?? '',
      juridicalAdress: json['juridical_adress'] ?? '',
      juridicalName: json['juridical_name'] ?? '',
      license: json['license'] ?? '',
      maxCashback: json['max_cashback'] ?? 0,
      minLink: json['min_link'] ?? '',
      offerPayout: json['offer_payout'] ?? 0,
      overdraft: json['overdraft'] ?? false,
      pauSystem: json['pay_system'] ?? '',
      payments: json['payments'] ?? '',
      percentCalculation: json['percent_calculation'] ?? '',
      percentOfRest: json['percent_of_rest'] ?? 0.0,
      phone: json['phone'] ?? '',
      picture: json['picture'] ?? '',
      plugInOptions: json['plug-in_options '] ?? '',
      service: json['service'] ?? '',
      serviceMaxPerMonth: json['service_max_per_month'] ?? 0,
      serviceMin: json['service_min'] ?? 0,
      site: json['site'] ?? '',
      support: json['support'] ?? '',
      tariffDocument: json['tariff_document'] ?? '',
      total: json['total'] ?? '',
      transfers: json['transfers'] ?? '',
      under18: json['under_18'] ?? false,
      wayToGetCard: json['way_to_get_card'] ?? '',
    );

Map<String, dynamic> _$$ListProductModelImplToJson(
        _$ListProductModelImpl instance) =>
    <String, dynamic>{
      'OGRN': instance.ogrn,
      'SMS_max': instance.smsMax,
      'SMS_min': instance.smsMin,
      '_id': instance.id,
      'accrual_of_bonuses': instance.accrualOfBonuses,
      'age_max': instance.ageMax,
      'age_min': instance.ageMin,
      'bank_details': instance.bankDetails,
      'best_offer': instance.bestOffer,
      'bonus_format': instance.bonusFormat,
      'bonus_program': instance.bonusProgram,
      'can_be_published': instance.canBePublished,
      'card_delievery': instance.cardDelievery,
      'card_issuance': instance.cardIssuance,
      'card_issuer_requirements': instance.cardIssuerRequirements,
      'card_name': instance.cardName,
      'cash_withdrawal': instance.cashWithdrawal,
      'cash_withdrawal_limit': instance.cashWithdrawalLimit,
      'cashback': instance.cashback,
      'currency_cards': instance.currencyCard,
      'discounts': instance.discounts,
      'features': instance.features,
      'for_kids': instance.forKids,
      'free_withdrawal_in_foreign_banks': instance.freeWithdrawalInForeignBanks,
      'hit': instance.hit,
      'image': instance.image,
      'juridical_adress': instance.juridicalAdress,
      'juridical_name': instance.juridicalName,
      'license': instance.license,
      'max_cashback': instance.maxCashback,
      'min_link': instance.minLink,
      'offer_payout': instance.offerPayout,
      'overdraft': instance.overdraft,
      'pay_system': instance.pauSystem,
      'payments': instance.payments,
      'percent_calculation': instance.percentCalculation,
      'percent_of_rest': instance.percentOfRest,
      'phone': instance.phone,
      'picture': instance.picture,
      'plug-in_options ': instance.plugInOptions,
      'service': instance.service,
      'service_max_per_month': instance.serviceMaxPerMonth,
      'service_min': instance.serviceMin,
      'site': instance.site,
      'support': instance.support,
      'tariff_document': instance.tariffDocument,
      'total': instance.total,
      'transfers': instance.transfers,
      'under_18': instance.under18,
      'way_to_get_card': instance.wayToGetCard,
    };

_$BankDetailsModelImpl _$$BankDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankDetailsModelImpl(
      id: json['_id'] ?? '',
      bankName: json['bank_name'] ?? '',
      color: json['color'] ?? '',
      picture: json['picture'] ?? '',
    );

Map<String, dynamic> _$$BankDetailsModelImplToJson(
        _$BankDetailsModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bank_name': instance.bankName,
      'color': instance.color,
      'picture': instance.picture,
    };
