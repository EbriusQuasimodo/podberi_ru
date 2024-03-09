// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zaimy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZaimyModel _$ZaimyModelFromJson(Map<String, dynamic> json) {
  return _ZaimyModel.fromJson(json);
}

/// @nodoc
mixin _$ZaimyModel {
  @JsonKey(name: 'items')
  List<ListZaimyModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZaimyModelCopyWith<ZaimyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZaimyModelCopyWith<$Res> {
  factory $ZaimyModelCopyWith(
          ZaimyModel value, $Res Function(ZaimyModel) then) =
      _$ZaimyModelCopyWithImpl<$Res, ZaimyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListZaimyModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class _$ZaimyModelCopyWithImpl<$Res, $Val extends ZaimyModel>
    implements $ZaimyModelCopyWith<$Res> {
  _$ZaimyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? itemsCount = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListZaimyModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZaimyModelImplCopyWith<$Res>
    implements $ZaimyModelCopyWith<$Res> {
  factory _$$ZaimyModelImplCopyWith(
          _$ZaimyModelImpl value, $Res Function(_$ZaimyModelImpl) then) =
      __$$ZaimyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListZaimyModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class __$$ZaimyModelImplCopyWithImpl<$Res>
    extends _$ZaimyModelCopyWithImpl<$Res, _$ZaimyModelImpl>
    implements _$$ZaimyModelImplCopyWith<$Res> {
  __$$ZaimyModelImplCopyWithImpl(
      _$ZaimyModelImpl _value, $Res Function(_$ZaimyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? itemsCount = null,
  }) {
    return _then(_$ZaimyModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListZaimyModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZaimyModelImpl implements _ZaimyModel {
  _$ZaimyModelImpl(
      {@JsonKey(name: 'items') final List<ListZaimyModel> items = const [],
      @JsonKey(name: 'items_count') this.itemsCount = 0})
      : _items = items;

  factory _$ZaimyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZaimyModelImplFromJson(json);

  final List<ListZaimyModel> _items;
  @override
  @JsonKey(name: 'items')
  List<ListZaimyModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;

  @override
  String toString() {
    return 'ZaimyModel(items: $items, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZaimyModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), itemsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZaimyModelImplCopyWith<_$ZaimyModelImpl> get copyWith =>
      __$$ZaimyModelImplCopyWithImpl<_$ZaimyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZaimyModelImplToJson(
      this,
    );
  }
}

abstract class _ZaimyModel implements ZaimyModel {
  factory _ZaimyModel(
      {@JsonKey(name: 'items') final List<ListZaimyModel> items,
      @JsonKey(name: 'items_count') final int itemsCount}) = _$ZaimyModelImpl;

  factory _ZaimyModel.fromJson(Map<String, dynamic> json) =
      _$ZaimyModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ListZaimyModel> get items;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;
  @override
  @JsonKey(ignore: true)
  _$$ZaimyModelImplCopyWith<_$ZaimyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListZaimyModel _$ListZaimyModelFromJson(Map<String, dynamic> json) {
  return _ListZaimyModel.fromJson(json);
}

/// @nodoc
mixin _$ListZaimyModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'all_conditions_link')
  String get allConditionsLink => throw _privateConstructorUsedError;
  bool get best => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_percent')
  dynamic get maxPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_term')
  int get maxTerm => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_percent')
  int get minPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_term')
  int get minTerm => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get popular => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref_link')
  String get refLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'sign_in_gosuslugi')
  bool get signInGosuslugi => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  int get sum => throw _privateConstructorUsedError;
  @JsonKey(name: 'term_format')
  String get termFormat => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListZaimyModelCopyWith<ListZaimyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListZaimyModelCopyWith<$Res> {
  factory $ListZaimyModelCopyWith(
          ListZaimyModel value, $Res Function(ListZaimyModel) then) =
      _$ListZaimyModelCopyWithImpl<$Res, ListZaimyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'all_conditions_link') String allConditionsLink,
      bool best,
      String color,
      bool enable,
      String image,
      @JsonKey(name: 'max_percent') dynamic maxPercent,
      @JsonKey(name: 'max_term') int maxTerm,
      @JsonKey(name: 'min_percent') int minPercent,
      @JsonKey(name: 'min_term') int minTerm,
      String name,
      bool popular,
      @JsonKey(name: 'ref_link') String refLink,
      @JsonKey(name: 'sign_in_gosuslugi') bool signInGosuslugi,
      String slug,
      int sum,
      @JsonKey(name: 'term_format') String termFormat,
      String type});
}

/// @nodoc
class _$ListZaimyModelCopyWithImpl<$Res, $Val extends ListZaimyModel>
    implements $ListZaimyModelCopyWith<$Res> {
  _$ListZaimyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? allConditionsLink = null,
    Object? best = null,
    Object? color = null,
    Object? enable = null,
    Object? image = null,
    Object? maxPercent = freezed,
    Object? maxTerm = null,
    Object? minPercent = null,
    Object? minTerm = null,
    Object? name = null,
    Object? popular = null,
    Object? refLink = null,
    Object? signInGosuslugi = null,
    Object? slug = null,
    Object? sum = null,
    Object? termFormat = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      allConditionsLink: null == allConditionsLink
          ? _value.allConditionsLink
          : allConditionsLink // ignore: cast_nullable_to_non_nullable
              as String,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      maxPercent: freezed == maxPercent
          ? _value.maxPercent
          : maxPercent // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxTerm: null == maxTerm
          ? _value.maxTerm
          : maxTerm // ignore: cast_nullable_to_non_nullable
              as int,
      minPercent: null == minPercent
          ? _value.minPercent
          : minPercent // ignore: cast_nullable_to_non_nullable
              as int,
      minTerm: null == minTerm
          ? _value.minTerm
          : minTerm // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      refLink: null == refLink
          ? _value.refLink
          : refLink // ignore: cast_nullable_to_non_nullable
              as String,
      signInGosuslugi: null == signInGosuslugi
          ? _value.signInGosuslugi
          : signInGosuslugi // ignore: cast_nullable_to_non_nullable
              as bool,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      termFormat: null == termFormat
          ? _value.termFormat
          : termFormat // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListZaimyModelImplCopyWith<$Res>
    implements $ListZaimyModelCopyWith<$Res> {
  factory _$$ListZaimyModelImplCopyWith(_$ListZaimyModelImpl value,
          $Res Function(_$ListZaimyModelImpl) then) =
      __$$ListZaimyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'all_conditions_link') String allConditionsLink,
      bool best,
      String color,
      bool enable,
      String image,
      @JsonKey(name: 'max_percent') dynamic maxPercent,
      @JsonKey(name: 'max_term') int maxTerm,
      @JsonKey(name: 'min_percent') int minPercent,
      @JsonKey(name: 'min_term') int minTerm,
      String name,
      bool popular,
      @JsonKey(name: 'ref_link') String refLink,
      @JsonKey(name: 'sign_in_gosuslugi') bool signInGosuslugi,
      String slug,
      int sum,
      @JsonKey(name: 'term_format') String termFormat,
      String type});
}

/// @nodoc
class __$$ListZaimyModelImplCopyWithImpl<$Res>
    extends _$ListZaimyModelCopyWithImpl<$Res, _$ListZaimyModelImpl>
    implements _$$ListZaimyModelImplCopyWith<$Res> {
  __$$ListZaimyModelImplCopyWithImpl(
      _$ListZaimyModelImpl _value, $Res Function(_$ListZaimyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? allConditionsLink = null,
    Object? best = null,
    Object? color = null,
    Object? enable = null,
    Object? image = null,
    Object? maxPercent = freezed,
    Object? maxTerm = null,
    Object? minPercent = null,
    Object? minTerm = null,
    Object? name = null,
    Object? popular = null,
    Object? refLink = null,
    Object? signInGosuslugi = null,
    Object? slug = null,
    Object? sum = null,
    Object? termFormat = null,
    Object? type = null,
  }) {
    return _then(_$ListZaimyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      allConditionsLink: null == allConditionsLink
          ? _value.allConditionsLink
          : allConditionsLink // ignore: cast_nullable_to_non_nullable
              as String,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      maxPercent: freezed == maxPercent
          ? _value.maxPercent
          : maxPercent // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxTerm: null == maxTerm
          ? _value.maxTerm
          : maxTerm // ignore: cast_nullable_to_non_nullable
              as int,
      minPercent: null == minPercent
          ? _value.minPercent
          : minPercent // ignore: cast_nullable_to_non_nullable
              as int,
      minTerm: null == minTerm
          ? _value.minTerm
          : minTerm // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      refLink: null == refLink
          ? _value.refLink
          : refLink // ignore: cast_nullable_to_non_nullable
              as String,
      signInGosuslugi: null == signInGosuslugi
          ? _value.signInGosuslugi
          : signInGosuslugi // ignore: cast_nullable_to_non_nullable
              as bool,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      termFormat: null == termFormat
          ? _value.termFormat
          : termFormat // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListZaimyModelImpl implements _ListZaimyModel {
  _$ListZaimyModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'all_conditions_link') this.allConditionsLink = '',
      this.best = false,
      this.color = '',
      this.enable = false,
      this.image = '',
      @JsonKey(name: 'max_percent') this.maxPercent = 0,
      @JsonKey(name: 'max_term') this.maxTerm = 0,
      @JsonKey(name: 'min_percent') this.minPercent = 0,
      @JsonKey(name: 'min_term') this.minTerm = 0,
      this.name = '',
      this.popular = false,
      @JsonKey(name: 'ref_link') this.refLink = '',
      @JsonKey(name: 'sign_in_gosuslugi') this.signInGosuslugi = false,
      this.slug = '',
      this.sum = 0,
      @JsonKey(name: 'term_format') this.termFormat = '',
      this.type = ''});

  factory _$ListZaimyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListZaimyModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'all_conditions_link')
  final String allConditionsLink;
  @override
  @JsonKey()
  final bool best;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final bool enable;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey(name: 'max_percent')
  final dynamic maxPercent;
  @override
  @JsonKey(name: 'max_term')
  final int maxTerm;
  @override
  @JsonKey(name: 'min_percent')
  final int minPercent;
  @override
  @JsonKey(name: 'min_term')
  final int minTerm;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool popular;
  @override
  @JsonKey(name: 'ref_link')
  final String refLink;
  @override
  @JsonKey(name: 'sign_in_gosuslugi')
  final bool signInGosuslugi;
  @override
  @JsonKey()
  final String slug;
  @override
  @JsonKey()
  final int sum;
  @override
  @JsonKey(name: 'term_format')
  final String termFormat;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'ListZaimyModel(id: $id, allConditionsLink: $allConditionsLink, best: $best, color: $color, enable: $enable, image: $image, maxPercent: $maxPercent, maxTerm: $maxTerm, minPercent: $minPercent, minTerm: $minTerm, name: $name, popular: $popular, refLink: $refLink, signInGosuslugi: $signInGosuslugi, slug: $slug, sum: $sum, termFormat: $termFormat, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListZaimyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.allConditionsLink, allConditionsLink) ||
                other.allConditionsLink == allConditionsLink) &&
            (identical(other.best, best) || other.best == best) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other.maxPercent, maxPercent) &&
            (identical(other.maxTerm, maxTerm) || other.maxTerm == maxTerm) &&
            (identical(other.minPercent, minPercent) ||
                other.minPercent == minPercent) &&
            (identical(other.minTerm, minTerm) || other.minTerm == minTerm) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.popular, popular) || other.popular == popular) &&
            (identical(other.refLink, refLink) || other.refLink == refLink) &&
            (identical(other.signInGosuslugi, signInGosuslugi) ||
                other.signInGosuslugi == signInGosuslugi) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            (identical(other.termFormat, termFormat) ||
                other.termFormat == termFormat) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      allConditionsLink,
      best,
      color,
      enable,
      image,
      const DeepCollectionEquality().hash(maxPercent),
      maxTerm,
      minPercent,
      minTerm,
      name,
      popular,
      refLink,
      signInGosuslugi,
      slug,
      sum,
      termFormat,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListZaimyModelImplCopyWith<_$ListZaimyModelImpl> get copyWith =>
      __$$ListZaimyModelImplCopyWithImpl<_$ListZaimyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListZaimyModelImplToJson(
      this,
    );
  }
}

abstract class _ListZaimyModel implements ListZaimyModel {
  factory _ListZaimyModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'all_conditions_link') final String allConditionsLink,
      final bool best,
      final String color,
      final bool enable,
      final String image,
      @JsonKey(name: 'max_percent') final dynamic maxPercent,
      @JsonKey(name: 'max_term') final int maxTerm,
      @JsonKey(name: 'min_percent') final int minPercent,
      @JsonKey(name: 'min_term') final int minTerm,
      final String name,
      final bool popular,
      @JsonKey(name: 'ref_link') final String refLink,
      @JsonKey(name: 'sign_in_gosuslugi') final bool signInGosuslugi,
      final String slug,
      final int sum,
      @JsonKey(name: 'term_format') final String termFormat,
      final String type}) = _$ListZaimyModelImpl;

  factory _ListZaimyModel.fromJson(Map<String, dynamic> json) =
      _$ListZaimyModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'all_conditions_link')
  String get allConditionsLink;
  @override
  bool get best;
  @override
  String get color;
  @override
  bool get enable;
  @override
  String get image;
  @override
  @JsonKey(name: 'max_percent')
  dynamic get maxPercent;
  @override
  @JsonKey(name: 'max_term')
  int get maxTerm;
  @override
  @JsonKey(name: 'min_percent')
  int get minPercent;
  @override
  @JsonKey(name: 'min_term')
  int get minTerm;
  @override
  String get name;
  @override
  bool get popular;
  @override
  @JsonKey(name: 'ref_link')
  String get refLink;
  @override
  @JsonKey(name: 'sign_in_gosuslugi')
  bool get signInGosuslugi;
  @override
  String get slug;
  @override
  int get sum;
  @override
  @JsonKey(name: 'term_format')
  String get termFormat;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ListZaimyModelImplCopyWith<_$ListZaimyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
