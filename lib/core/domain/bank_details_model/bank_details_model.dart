// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_details_model.g.dart';

part 'bank_details_model.freezed.dart';

@freezed
class BanksDetailsModel with _$BanksDetailsModel {
  factory BanksDetailsModel({
    @Default([]) @JsonKey(name: 'items') List<BankListDetailsModel> items,
    @Default(0) @JsonKey(name: 'items_count') int itemsCount,
  }) = _BanksDetailsModel;

  factory BanksDetailsModel.fromJson(Map<String, Object?> json) =>
      _$BanksDetailsModelFromJson(json);
}

@freezed
class BankListDetailsModel with _$BankListDetailsModel {
  factory BankListDetailsModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'bank_name') String bankName,
    @Default('') String color,
    @Default('') String icon,
    @Default('') @JsonKey(name: 'juridical_name') String juridicalName,
    @Default(0) @JsonKey(name: 'license_number') int licenseNumber,
    @Default('') String logo,
    @Default('') @JsonKey(name: 'main_office_address') String mainOfficeAddress,
    @Default(0) int ogrn,
    @Default('') @JsonKey(name: 'phone_number') String phoneNumber,
    @Default('') @JsonKey(name: 'reg_date') String regDate,
    @Default('') String site,
  }) = _BankListDetailsModel;

  factory BankListDetailsModel.fromJson(Map<String, Object?> json) =>
      _$BankListDetailsModelFromJson(json);
}