// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'zaimy_model.g.dart';

part 'zaimy_model.freezed.dart';

@freezed
class ZaimyModel with _$ZaimyModel {
  factory ZaimyModel({
    @Default([]) @JsonKey(name: 'items') List<ListZaimyModel> items,
    @Default(0) @JsonKey(name: 'items_count') int itemsCount,
  }) = _ZaimyModel;

  factory ZaimyModel.fromJson(Map<String, Object?> json) =>
      _$ZaimyModelFromJson(json);
}

@freezed
class ListZaimyModel with _$ListZaimyModel {
  factory ListZaimyModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'all_conditions_link') String allConditionsLink,
    @Default(false) bool best,
    @Default('') String color,
    @Default(false) bool enable,
    @Default('') String image,
    @Default(0) @JsonKey(name: 'max_percent') int maxPercent,
    @Default(0) @JsonKey(name: 'max_term') int maxTerm,
    @Default(0) @JsonKey(name: 'min_percent') int minPercent,
    @Default(0) @JsonKey(name: 'min_term') int minTerm,
    @Default('') String name,
    @Default(false) bool popular,
    @Default('') @JsonKey(name: 'ref_link') String refLink,
    @Default(false) @JsonKey(name: 'sign_in_gosuslugi') bool signInGosuslugi,
    @Default('') String slug,
    @Default(0) int sum,
    @Default('') @JsonKey(name: 'term_format') String termFormat,
    @Default('') String type,
  }) = _ListZaimyModel;

  factory ListZaimyModel.fromJson(Map<String, Object?> json) =>
      _$ListZaimyModelFromJson(json);
}