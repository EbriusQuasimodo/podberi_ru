// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rko_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RkoModelImpl _$$RkoModelImplFromJson(Map<String, dynamic> json) =>
    _$RkoModelImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ListRkoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemsCount: json['items_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$RkoModelImplToJson(_$RkoModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'items_count': instance.itemsCount,
    };

_$ListRkoModelImpl _$$ListRkoModelImplFromJson(Map<String, dynamic> json) =>
    _$ListRkoModelImpl(
      id: json['_id'] as String? ?? '',
      bankDetails: json['bank_details'] == null
          ? null
          : BankListDetailsModel.fromJson(
              json['bank_details'] as Map<String, dynamic>),
      operDayHere: json['oper_day_here'] == null
          ? null
          : RkoOperDateModel.fromJson(
              json['oper_day_here'] as Map<String, dynamic>),
      operDayThere: json['oper_day_there'] == null
          ? null
          : RkoOperDateModel.fromJson(
              json['oper_day_there'] as Map<String, dynamic>),
      bankName: json['bank_name'] as String? ?? '',
      best: json['best'] as bool? ?? false,
      enable: json['enable'] as bool? ?? false,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      forIp: json['for_ip'] as bool? ?? false,
      forOoo: json['for_ooo'] as bool? ?? false,
      minEq: json['min_eq'] as int? ?? 0,
      openingOnline: json['opening_online'] as bool? ?? false,
      popular: json['popular'] as bool? ?? false,
      priceOpen: json['price_open'] as int? ?? 0,
      rateNumber: json['rateNumber'] as int? ?? 0,
      rates: (json['rates'] as List<dynamic>?)
          ?.map((e) => RkoRatesListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratesName: json['ratesName'] as String? ?? '',
      refLink: json['ref_link'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$$ListRkoModelImplToJson(_$ListRkoModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bank_details': instance.bankDetails,
      'oper_day_here': instance.operDayHere,
      'oper_day_there': instance.operDayThere,
      'bank_name': instance.bankName,
      'best': instance.best,
      'enable': instance.enable,
      'features': instance.features,
      'for_ip': instance.forIp,
      'for_ooo': instance.forOoo,
      'min_eq': instance.minEq,
      'opening_online': instance.openingOnline,
      'popular': instance.popular,
      'price_open': instance.priceOpen,
      'rateNumber': instance.rateNumber,
      'rates': instance.rates,
      'ratesName': instance.ratesName,
      'ref_link': instance.refLink,
      'slug': instance.slug,
    };

_$RkoOperDateModelImpl _$$RkoOperDateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RkoOperDateModelImpl(
      from: json['from'] as String? ?? '',
      to: json['to'] as String? ?? '',
    );

Map<String, dynamic> _$$RkoOperDateModelImplToJson(
        _$RkoOperDateModelImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

_$RkoRatesListModelImpl _$$RkoRatesListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RkoRatesListModelImpl(
      allConditionsLink: json['all_conditions_link'] as String? ?? '',
      credits: json['credits'] as bool? ?? false,
      creditsText: json['credits_text'] as String? ?? '',
      deposits: json['deposits'] as bool? ?? false,
      depositsText: json['deposits_text'] as String? ?? '',
      descriptions: json['descriptions'] == null
          ? null
          : RkoRatesDescriptionsModel.fromJson(
              json['descriptions'] as Map<String, dynamic>),
      freeTransfersUr: json['free_transfers_ur'] as String? ?? '',
      government: json['government'] as bool? ?? false,
      interestOnBalance: json['interest_on_balance'] as bool? ?? false,
      main: json['main'] ?? 0,
      name: json['name'] as String? ?? '',
      onlineAccounting: json['online_accounting'] as bool? ?? false,
      priceTransfersUr: json['price_transfers_ur'] as int? ?? 0,
      service1Month: json['service_1_month'] as int? ?? 0,
      service1Year: json['service_1_year'] as int? ?? 0,
      service3Month: json['service_3_month'] as int? ?? 0,
      service6Month: json['service_6_month'] as int? ?? 0,
      serviceForever: json['service_forever'] as int? ?? 0,
    );

Map<String, dynamic> _$$RkoRatesListModelImplToJson(
        _$RkoRatesListModelImpl instance) =>
    <String, dynamic>{
      'all_conditions_link': instance.allConditionsLink,
      'credits': instance.credits,
      'credits_text': instance.creditsText,
      'deposits': instance.deposits,
      'deposits_text': instance.depositsText,
      'descriptions': instance.descriptions,
      'free_transfers_ur': instance.freeTransfersUr,
      'government': instance.government,
      'interest_on_balance': instance.interestOnBalance,
      'main': instance.main,
      'name': instance.name,
      'online_accounting': instance.onlineAccounting,
      'price_transfers_ur': instance.priceTransfersUr,
      'service_1_month': instance.service1Month,
      'service_1_year': instance.service1Year,
      'service_3_month': instance.service3Month,
      'service_6_month': instance.service6Month,
      'service_forever': instance.serviceForever,
    };

_$RkoRatesDescriptionsModelImpl _$$RkoRatesDescriptionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RkoRatesDescriptionsModelImpl(
      cashWithdrawal: json['cash_withdrawal'] as String? ?? '',
      transferCommission: json['transfer_commission'] as String? ?? '',
    );

Map<String, dynamic> _$$RkoRatesDescriptionsModelImplToJson(
        _$RkoRatesDescriptionsModelImpl instance) =>
    <String, dynamic>{
      'cash_withdrawal': instance.cashWithdrawal,
      'transfer_commission': instance.transferCommission,
    };
