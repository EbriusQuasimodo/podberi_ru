// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditCardsModelImpl _$$CreditCardsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditCardsModelImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  ListCreditCardsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemsCount: json['items_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$CreditCardsModelImplToJson(
        _$CreditCardsModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'items_count': instance.itemsCount,
    };

_$ListCreditCardsModelImpl _$$ListCreditCardsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListCreditCardsModelImpl(
      id: json['_id'] as String? ?? '',
      allConditionsLink: json['all_conditions_link'] as String? ?? '',
      bankDetails: json['bank_details'] == null
          ? null
          : BankListDetailsModel.fromJson(
              json['bank_details'] as Map<String, dynamic>),
      bankName: json['bank_name'] as String? ?? '',
      best: json['best'] as bool? ?? false,
      cashbackFormat: json['cashback_format'] as String? ?? '',
      citizenshipRussia: json['citizenship_russia'] as bool? ?? false,
      conditions: json['conditions'] == null
          ? null
          : CreditCardsConditionsModel.fromJson(
              json['conditions'] as Map<String, dynamic>),
      creditLimit: json['credit_limit'] as int? ?? 0,
      creditRates: (json['credit_rates'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      delivery: json['delivery'] as bool? ?? false,
      descriptions: json['descriptions'] == null
          ? null
          : CreditCardsDescriptionsModel.fromJson(
              json['descriptions'] as Map<String, dynamic>),
      enable: json['enable'] as bool? ?? false,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      image: json['image'] as String? ?? '',
      issue: json['issue'] as int? ?? 0,
      maxAge: json['max_age'] as int? ?? 0,
      maxCashBack: json['max_cashback'] as String? ?? '',
      maxCashbackPercent: json['max_cashback_percent'] as int? ?? 0,
      maxPercent: (json['max_percent'] as num?)?.toDouble() ?? 0,
      maxService: json['max_service'] as int? ?? 0,
      maxSms: json['max_sms'] as int? ?? 0,
      minAge: json['min_age'] as int? ?? 0,
      minIncome: json['min_income'] as int? ?? 0,
      minPercent: (json['min_percent'] as num?)?.toDouble() ?? 0,
      minService: json['min_service'] as int? ?? 0,
      minSms: json['min_sms'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      noPercentPeriod: json['no_percent_period'] as int? ?? 0,
      paymentSystem: json['payment_system'] as String? ?? '',
      popular: json['popular'] as bool? ?? false,
      refLink: json['ref_link'] as String? ?? '',
      regRussia: json['reg_russia'] as bool? ?? false,
      reissue: json['reissue'] as int? ?? 0,
      slug: json['slug'] as String? ?? '',
      withRefinancing: json['with_refinancing'] as bool? ?? false,
      workExp: json['work_exp'] as String? ?? '',
    );

Map<String, dynamic> _$$ListCreditCardsModelImplToJson(
        _$ListCreditCardsModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'all_conditions_link': instance.allConditionsLink,
      'bank_details': instance.bankDetails,
      'bank_name': instance.bankName,
      'best': instance.best,
      'cashback_format': instance.cashbackFormat,
      'citizenship_russia': instance.citizenshipRussia,
      'conditions': instance.conditions,
      'credit_limit': instance.creditLimit,
      'credit_rates': instance.creditRates,
      'delivery': instance.delivery,
      'descriptions': instance.descriptions,
      'enable': instance.enable,
      'features': instance.features,
      'image': instance.image,
      'issue': instance.issue,
      'max_age': instance.maxAge,
      'max_cashback': instance.maxCashBack,
      'max_cashback_percent': instance.maxCashbackPercent,
      'max_percent': instance.maxPercent,
      'max_service': instance.maxService,
      'max_sms': instance.maxSms,
      'min_age': instance.minAge,
      'min_income': instance.minIncome,
      'min_percent': instance.minPercent,
      'min_service': instance.minService,
      'min_sms': instance.minSms,
      'name': instance.name,
      'no_percent_period': instance.noPercentPeriod,
      'payment_system': instance.paymentSystem,
      'popular': instance.popular,
      'ref_link': instance.refLink,
      'reg_russia': instance.regRussia,
      'reissue': instance.reissue,
      'slug': instance.slug,
      'with_refinancing': instance.withRefinancing,
      'work_exp': instance.workExp,
    };

_$CreditCardsConditionsModelImpl _$$CreditCardsConditionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditCardsConditionsModelImpl(
      addRequirements: json['add_requirements'] as String? ?? '',
      cashWithdrawal: json['cash_withdrawal'] as String? ?? '',
      cashback: json['cashback'] as String? ?? '',
      stocks: json['stocks'] as String? ?? '',
    );

Map<String, dynamic> _$$CreditCardsConditionsModelImplToJson(
        _$CreditCardsConditionsModelImpl instance) =>
    <String, dynamic>{
      'add_requirements': instance.addRequirements,
      'cash_withdrawal': instance.cashWithdrawal,
      'cashback': instance.cashback,
      'stocks': instance.stocks,
    };

_$CreditCardsDescriptionsModelImpl _$$CreditCardsDescriptionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditCardsDescriptionsModelImpl(
      addServices: json['add_services'] as String? ?? '',
      cashWithdrawal: json['cash_withdrawal'] as String? ?? '',
      execution: json['execution'] as String? ?? '',
      noPercent: json['no_percent'] as String? ?? '',
      rates: json['rates'] as String? ?? '',
      refinancing: json['refinancing'] as String? ?? '',
      result: json['result'] as String? ?? '',
      transfers: json['transfers'] as String? ?? '',
    );

Map<String, dynamic> _$$CreditCardsDescriptionsModelImplToJson(
        _$CreditCardsDescriptionsModelImpl instance) =>
    <String, dynamic>{
      'add_services': instance.addServices,
      'cash_withdrawal': instance.cashWithdrawal,
      'execution': instance.execution,
      'no_percent': instance.noPercent,
      'rates': instance.rates,
      'refinancing': instance.refinancing,
      'result': instance.result,
      'transfers': instance.transfers,
    };
