// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BanksDetailsModel _$BanksDetailsModelFromJson(Map<String, dynamic> json) {
  return _BanksDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$BanksDetailsModel {
  @JsonKey(name: 'items')
  List<BankListDetailsModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BanksDetailsModelCopyWith<BanksDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BanksDetailsModelCopyWith<$Res> {
  factory $BanksDetailsModelCopyWith(
          BanksDetailsModel value, $Res Function(BanksDetailsModel) then) =
      _$BanksDetailsModelCopyWithImpl<$Res, BanksDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<BankListDetailsModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class _$BanksDetailsModelCopyWithImpl<$Res, $Val extends BanksDetailsModel>
    implements $BanksDetailsModelCopyWith<$Res> {
  _$BanksDetailsModelCopyWithImpl(this._value, this._then);

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
              as List<BankListDetailsModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BanksDetailsModelImplCopyWith<$Res>
    implements $BanksDetailsModelCopyWith<$Res> {
  factory _$$BanksDetailsModelImplCopyWith(_$BanksDetailsModelImpl value,
          $Res Function(_$BanksDetailsModelImpl) then) =
      __$$BanksDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<BankListDetailsModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class __$$BanksDetailsModelImplCopyWithImpl<$Res>
    extends _$BanksDetailsModelCopyWithImpl<$Res, _$BanksDetailsModelImpl>
    implements _$$BanksDetailsModelImplCopyWith<$Res> {
  __$$BanksDetailsModelImplCopyWithImpl(_$BanksDetailsModelImpl _value,
      $Res Function(_$BanksDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? itemsCount = null,
  }) {
    return _then(_$BanksDetailsModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BankListDetailsModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BanksDetailsModelImpl implements _BanksDetailsModel {
  _$BanksDetailsModelImpl(
      {@JsonKey(name: 'items')
      final List<BankListDetailsModel> items = const [],
      @JsonKey(name: 'items_count') this.itemsCount = 0})
      : _items = items;

  factory _$BanksDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BanksDetailsModelImplFromJson(json);

  final List<BankListDetailsModel> _items;
  @override
  @JsonKey(name: 'items')
  List<BankListDetailsModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;

  @override
  String toString() {
    return 'BanksDetailsModel(items: $items, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BanksDetailsModelImpl &&
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
  _$$BanksDetailsModelImplCopyWith<_$BanksDetailsModelImpl> get copyWith =>
      __$$BanksDetailsModelImplCopyWithImpl<_$BanksDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BanksDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _BanksDetailsModel implements BanksDetailsModel {
  factory _BanksDetailsModel(
          {@JsonKey(name: 'items') final List<BankListDetailsModel> items,
          @JsonKey(name: 'items_count') final int itemsCount}) =
      _$BanksDetailsModelImpl;

  factory _BanksDetailsModel.fromJson(Map<String, dynamic> json) =
      _$BanksDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<BankListDetailsModel> get items;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;
  @override
  @JsonKey(ignore: true)
  _$$BanksDetailsModelImplCopyWith<_$BanksDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankListDetailsModel _$BankListDetailsModelFromJson(Map<String, dynamic> json) {
  return _BankListDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$BankListDetailsModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String get bankName => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'juridical_name')
  String get juridicalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  int get licenseNumber => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_office_address')
  String get mainOfficeAddress => throw _privateConstructorUsedError;
  int get ogrn => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'reg_date')
  String get regDate => throw _privateConstructorUsedError;
  String get site => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankListDetailsModelCopyWith<BankListDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankListDetailsModelCopyWith<$Res> {
  factory $BankListDetailsModelCopyWith(BankListDetailsModel value,
          $Res Function(BankListDetailsModel) then) =
      _$BankListDetailsModelCopyWithImpl<$Res, BankListDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'bank_name') String bankName,
      String color,
      String icon,
      @JsonKey(name: 'juridical_name') String juridicalName,
      @JsonKey(name: 'license_number') int licenseNumber,
      String logo,
      @JsonKey(name: 'main_office_address') String mainOfficeAddress,
      int ogrn,
      @JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'reg_date') String regDate,
      String site});
}

/// @nodoc
class _$BankListDetailsModelCopyWithImpl<$Res,
        $Val extends BankListDetailsModel>
    implements $BankListDetailsModelCopyWith<$Res> {
  _$BankListDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankName = null,
    Object? color = null,
    Object? icon = null,
    Object? juridicalName = null,
    Object? licenseNumber = null,
    Object? logo = null,
    Object? mainOfficeAddress = null,
    Object? ogrn = null,
    Object? phoneNumber = null,
    Object? regDate = null,
    Object? site = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      juridicalName: null == juridicalName
          ? _value.juridicalName
          : juridicalName // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      mainOfficeAddress: null == mainOfficeAddress
          ? _value.mainOfficeAddress
          : mainOfficeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ogrn: null == ogrn
          ? _value.ogrn
          : ogrn // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      regDate: null == regDate
          ? _value.regDate
          : regDate // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankListDetailsModelImplCopyWith<$Res>
    implements $BankListDetailsModelCopyWith<$Res> {
  factory _$$BankListDetailsModelImplCopyWith(_$BankListDetailsModelImpl value,
          $Res Function(_$BankListDetailsModelImpl) then) =
      __$$BankListDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'bank_name') String bankName,
      String color,
      String icon,
      @JsonKey(name: 'juridical_name') String juridicalName,
      @JsonKey(name: 'license_number') int licenseNumber,
      String logo,
      @JsonKey(name: 'main_office_address') String mainOfficeAddress,
      int ogrn,
      @JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'reg_date') String regDate,
      String site});
}

/// @nodoc
class __$$BankListDetailsModelImplCopyWithImpl<$Res>
    extends _$BankListDetailsModelCopyWithImpl<$Res, _$BankListDetailsModelImpl>
    implements _$$BankListDetailsModelImplCopyWith<$Res> {
  __$$BankListDetailsModelImplCopyWithImpl(_$BankListDetailsModelImpl _value,
      $Res Function(_$BankListDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankName = null,
    Object? color = null,
    Object? icon = null,
    Object? juridicalName = null,
    Object? licenseNumber = null,
    Object? logo = null,
    Object? mainOfficeAddress = null,
    Object? ogrn = null,
    Object? phoneNumber = null,
    Object? regDate = null,
    Object? site = null,
  }) {
    return _then(_$BankListDetailsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      juridicalName: null == juridicalName
          ? _value.juridicalName
          : juridicalName // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      mainOfficeAddress: null == mainOfficeAddress
          ? _value.mainOfficeAddress
          : mainOfficeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ogrn: null == ogrn
          ? _value.ogrn
          : ogrn // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      regDate: null == regDate
          ? _value.regDate
          : regDate // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankListDetailsModelImpl implements _BankListDetailsModel {
  _$BankListDetailsModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'bank_name') this.bankName = '',
      this.color = '',
      this.icon = '',
      @JsonKey(name: 'juridical_name') this.juridicalName = '',
      @JsonKey(name: 'license_number') this.licenseNumber = 0,
      this.logo = '',
      @JsonKey(name: 'main_office_address') this.mainOfficeAddress = '',
      this.ogrn = 0,
      @JsonKey(name: 'phone_number') this.phoneNumber = '',
      @JsonKey(name: 'reg_date') this.regDate = '',
      this.site = ''});

  factory _$BankListDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankListDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'bank_name')
  final String bankName;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final String icon;
  @override
  @JsonKey(name: 'juridical_name')
  final String juridicalName;
  @override
  @JsonKey(name: 'license_number')
  final int licenseNumber;
  @override
  @JsonKey()
  final String logo;
  @override
  @JsonKey(name: 'main_office_address')
  final String mainOfficeAddress;
  @override
  @JsonKey()
  final int ogrn;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  @JsonKey(name: 'reg_date')
  final String regDate;
  @override
  @JsonKey()
  final String site;

  @override
  String toString() {
    return 'BankListDetailsModel(id: $id, bankName: $bankName, color: $color, icon: $icon, juridicalName: $juridicalName, licenseNumber: $licenseNumber, logo: $logo, mainOfficeAddress: $mainOfficeAddress, ogrn: $ogrn, phoneNumber: $phoneNumber, regDate: $regDate, site: $site)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankListDetailsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.juridicalName, juridicalName) ||
                other.juridicalName == juridicalName) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.mainOfficeAddress, mainOfficeAddress) ||
                other.mainOfficeAddress == mainOfficeAddress) &&
            (identical(other.ogrn, ogrn) || other.ogrn == ogrn) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.regDate, regDate) || other.regDate == regDate) &&
            (identical(other.site, site) || other.site == site));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bankName,
      color,
      icon,
      juridicalName,
      licenseNumber,
      logo,
      mainOfficeAddress,
      ogrn,
      phoneNumber,
      regDate,
      site);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankListDetailsModelImplCopyWith<_$BankListDetailsModelImpl>
      get copyWith =>
          __$$BankListDetailsModelImplCopyWithImpl<_$BankListDetailsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankListDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _BankListDetailsModel implements BankListDetailsModel {
  factory _BankListDetailsModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'bank_name') final String bankName,
      final String color,
      final String icon,
      @JsonKey(name: 'juridical_name') final String juridicalName,
      @JsonKey(name: 'license_number') final int licenseNumber,
      final String logo,
      @JsonKey(name: 'main_office_address') final String mainOfficeAddress,
      final int ogrn,
      @JsonKey(name: 'phone_number') final String phoneNumber,
      @JsonKey(name: 'reg_date') final String regDate,
      final String site}) = _$BankListDetailsModelImpl;

  factory _BankListDetailsModel.fromJson(Map<String, dynamic> json) =
      _$BankListDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'bank_name')
  String get bankName;
  @override
  String get color;
  @override
  String get icon;
  @override
  @JsonKey(name: 'juridical_name')
  String get juridicalName;
  @override
  @JsonKey(name: 'license_number')
  int get licenseNumber;
  @override
  String get logo;
  @override
  @JsonKey(name: 'main_office_address')
  String get mainOfficeAddress;
  @override
  int get ogrn;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  @JsonKey(name: 'reg_date')
  String get regDate;
  @override
  String get site;
  @override
  @JsonKey(ignore: true)
  _$$BankListDetailsModelImplCopyWith<_$BankListDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
