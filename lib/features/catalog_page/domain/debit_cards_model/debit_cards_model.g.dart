// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_cards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebitCardsModelImpl _$$DebitCardsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DebitCardsModelImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  ListDebitCardsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemsCount: json['items_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$DebitCardsModelImplToJson(
        _$DebitCardsModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'items_count': instance.itemsCount,
    };

_$ListDebitCardsModelImpl _$$ListDebitCardsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListDebitCardsModelImpl(
      id: json['_id'] as String? ?? '',
      allConditionsLink: json['all_conditions_link'] as String? ?? '',
      bankDetails: json['bank_details'] == null
          ? null
          : BankListDetailsModel.fromJson(
              json['bank_details'] as Map<String, dynamic>),
      bankName: json['bank_name'] as String? ?? '',
      best: json['best'] as bool? ?? false,
      cashOtherBanks: json['cash_other_banks'] as bool? ?? false,
      cashbackFormat: json['cashback_format'] as String? ?? '',
      citizenshipRussia: json['citizenship_russia'] as bool? ?? false,
      conditions: json['conditions'] == null
          ? null
          : DebitCardsConditionsModel.fromJson(
              json['conditions'] as Map<String, dynamic>),
      currencies: json['currencies'] as String? ?? '',
      delivery: json['delivery'] as bool? ?? false,
      descriptions: json['descriptions'] == null
          ? null
          : DebitCardsDescriptionsModel.fromJson(
              json['descriptions'] as Map<String, dynamic>),
      enable: json['enable'] as bool? ?? false,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      forChildren: json['for_children'] as bool? ?? false,
      forMinors: json['for_minors'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      interestOnBalance: json['interest_on_balance'] as int? ?? 0,
      issue: json['issue'] as int? ?? 0,
      maxAge: json['max_age'] as int? ?? 0,
      maxCashBack: json['max_cashback'] as String? ?? '',
      maxCashbackPercent: json['max_cashback_percent'] as int? ?? 0,
      maxService: json['max_service'] as int? ?? 0,
      maxSms: json['max_sms'] as int? ?? 0,
      minAge: json['min_age'] as int? ?? 0,
      minService: json['min_service'] as int? ?? 0,
      minSms: json['min_sms'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      overdraft: json['overdraft'] as bool? ?? false,
      paymentSystem: json['payment_system'] as String? ?? '',
      popular: json['popular'] as bool? ?? false,
      refLink: json['ref_link'] as String? ?? '',
      regRussia: json['reg_russia'] as bool? ?? false,
      reissue: json['reissue'] as int? ?? 0,
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$$ListDebitCardsModelImplToJson(
        _$ListDebitCardsModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'all_conditions_link': instance.allConditionsLink,
      'bank_details': instance.bankDetails,
      'bank_name': instance.bankName,
      'best': instance.best,
      'cash_other_banks': instance.cashOtherBanks,
      'cashback_format': instance.cashbackFormat,
      'citizenship_russia': instance.citizenshipRussia,
      'conditions': instance.conditions,
      'currencies': instance.currencies,
      'delivery': instance.delivery,
      'descriptions': instance.descriptions,
      'enable': instance.enable,
      'features': instance.features,
      'for_children': instance.forChildren,
      'for_minors': instance.forMinors,
      'image': instance.image,
      'interest_on_balance': instance.interestOnBalance,
      'issue': instance.issue,
      'max_age': instance.maxAge,
      'max_cashback': instance.maxCashBack,
      'max_cashback_percent': instance.maxCashbackPercent,
      'max_service': instance.maxService,
      'max_sms': instance.maxSms,
      'min_age': instance.minAge,
      'min_service': instance.minService,
      'min_sms': instance.minSms,
      'name': instance.name,
      'overdraft': instance.overdraft,
      'payment_system': instance.paymentSystem,
      'popular': instance.popular,
      'ref_link': instance.refLink,
      'reg_russia': instance.regRussia,
      'reissue': instance.reissue,
      'slug': instance.slug,
    };

_$DebitCardsConditionsModelImpl _$$DebitCardsConditionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DebitCardsConditionsModelImpl(
      accrualOfBonuses: json['accrual_of_bonuses'] as String? ?? '',
      cashWithdrawal: json['cash_withdrawal'] as String? ?? '',
      stocks: json['stocks'] as String? ?? '',
    );

Map<String, dynamic> _$$DebitCardsConditionsModelImplToJson(
        _$DebitCardsConditionsModelImpl instance) =>
    <String, dynamic>{
      'accrual_of_bonuses': instance.accrualOfBonuses,
      'cash_withdrawal': instance.cashWithdrawal,
      'stocks': instance.stocks,
    };

_$DebitCardsDescriptionsModelImpl _$$DebitCardsDescriptionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DebitCardsDescriptionsModelImpl(
      bonusProgram: json['bonus_program'] as String? ?? '',
      cashWithdrawal: json['cash_withdrawal'] as String? ?? '',
      connectableOptions: json['connectable_options'] as String? ?? '',
      execution: json['execution'] as String? ?? '',
      interestCalculation: json['interest_calculation'] as String? ?? '',
      result: json['result'] as String? ?? '',
      service: json['service'] as String? ?? '',
      stocks: json['stocks'] as String? ?? '',
      support: json['support'] as String? ?? '',
      transfers: json['transfers'] as String? ?? '',
    );

Map<String, dynamic> _$$DebitCardsDescriptionsModelImplToJson(
        _$DebitCardsDescriptionsModelImpl instance) =>
    <String, dynamic>{
      'bonus_program': instance.bonusProgram,
      'cash_withdrawal': instance.cashWithdrawal,
      'connectable_options': instance.connectableOptions,
      'execution': instance.execution,
      'interest_calculation': instance.interestCalculation,
      'result': instance.result,
      'service': instance.service,
      'stocks': instance.stocks,
      'support': instance.support,
      'transfers': instance.transfers,
    };
