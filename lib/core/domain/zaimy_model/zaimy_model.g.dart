// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zaimy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZaimyModelImpl _$$ZaimyModelImplFromJson(Map<String, dynamic> json) =>
    _$ZaimyModelImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ListZaimyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemsCount: json['items_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$ZaimyModelImplToJson(_$ZaimyModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'items_count': instance.itemsCount,
    };

_$ListZaimyModelImpl _$$ListZaimyModelImplFromJson(Map<String, dynamic> json) =>
    _$ListZaimyModelImpl(
      id: json['_id'] as String? ?? '',
      allConditionsLink: json['all_conditions_link'] as String? ?? '',
      best: json['best'] as bool? ?? false,
      color: json['color'] as String? ?? '',
      enable: json['enable'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      maxPercent: json['max_percent'] ?? 0,
      maxTerm: json['max_term'] as int? ?? 0,
      minPercent: json['min_percent'] as int? ?? 0,
      minTerm: json['min_term'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      popular: json['popular'] as bool? ?? false,
      refLink: json['ref_link'] as String? ?? '',
      signInGosuslugi: json['sign_in_gosuslugi'] as bool? ?? false,
      slug: json['slug'] as String? ?? '',
      sum: json['sum'] as int? ?? 0,
      termFormat: json['term_format'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$ListZaimyModelImplToJson(
        _$ListZaimyModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'all_conditions_link': instance.allConditionsLink,
      'best': instance.best,
      'color': instance.color,
      'enable': instance.enable,
      'image': instance.image,
      'max_percent': instance.maxPercent,
      'max_term': instance.maxTerm,
      'min_percent': instance.minPercent,
      'min_term': instance.minTerm,
      'name': instance.name,
      'popular': instance.popular,
      'ref_link': instance.refLink,
      'sign_in_gosuslugi': instance.signInGosuslugi,
      'slug': instance.slug,
      'sum': instance.sum,
      'term_format': instance.termFormat,
      'type': instance.type,
    };
