// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BanksDetailsModelImpl _$$BanksDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BanksDetailsModelImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  BankListDetailsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemsCount: json['items_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$BanksDetailsModelImplToJson(
        _$BanksDetailsModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'items_count': instance.itemsCount,
    };

_$BankListDetailsModelImpl _$$BankListDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankListDetailsModelImpl(
      id: json['_id'] as String? ?? '',
      bankName: json['bank_name'] as String? ?? '',
      color: json['color'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      juridicalName: json['juridical_name'] as String? ?? '',
      licenseNumber: json['license_number'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
      mainOfficeAddress: json['main_office_address'] as String? ?? '',
      ogrn: json['ogrn'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      regDate: json['reg_date'] as String? ?? '',
      site: json['site'] as String? ?? '',
    );

Map<String, dynamic> _$$BankListDetailsModelImplToJson(
        _$BankListDetailsModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bank_name': instance.bankName,
      'color': instance.color,
      'icon': instance.icon,
      'juridical_name': instance.juridicalName,
      'license_number': instance.licenseNumber,
      'logo': instance.logo,
      'main_office_address': instance.mainOfficeAddress,
      'ogrn': instance.ogrn,
      'phone_number': instance.phoneNumber,
      'reg_date': instance.regDate,
      'site': instance.site,
    };
