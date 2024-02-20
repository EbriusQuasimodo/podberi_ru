// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rko_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RkoModel _$RkoModelFromJson(Map<String, dynamic> json) {
  return _RkoModel.fromJson(json);
}

/// @nodoc
mixin _$RkoModel {
  @JsonKey(name: 'items')
  List<ListRkoModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RkoModelCopyWith<RkoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RkoModelCopyWith<$Res> {
  factory $RkoModelCopyWith(RkoModel value, $Res Function(RkoModel) then) =
      _$RkoModelCopyWithImpl<$Res, RkoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListRkoModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class _$RkoModelCopyWithImpl<$Res, $Val extends RkoModel>
    implements $RkoModelCopyWith<$Res> {
  _$RkoModelCopyWithImpl(this._value, this._then);

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
              as List<ListRkoModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RkoModelImplCopyWith<$Res>
    implements $RkoModelCopyWith<$Res> {
  factory _$$RkoModelImplCopyWith(
          _$RkoModelImpl value, $Res Function(_$RkoModelImpl) then) =
      __$$RkoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListRkoModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class __$$RkoModelImplCopyWithImpl<$Res>
    extends _$RkoModelCopyWithImpl<$Res, _$RkoModelImpl>
    implements _$$RkoModelImplCopyWith<$Res> {
  __$$RkoModelImplCopyWithImpl(
      _$RkoModelImpl _value, $Res Function(_$RkoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? itemsCount = null,
  }) {
    return _then(_$RkoModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListRkoModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RkoModelImpl implements _RkoModel {
  _$RkoModelImpl(
      {@JsonKey(name: 'items') final List<ListRkoModel> items = const [],
      @JsonKey(name: 'items_count') this.itemsCount = 0})
      : _items = items;

  factory _$RkoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RkoModelImplFromJson(json);

  final List<ListRkoModel> _items;
  @override
  @JsonKey(name: 'items')
  List<ListRkoModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;

  @override
  String toString() {
    return 'RkoModel(items: $items, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RkoModelImpl &&
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
  _$$RkoModelImplCopyWith<_$RkoModelImpl> get copyWith =>
      __$$RkoModelImplCopyWithImpl<_$RkoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RkoModelImplToJson(
      this,
    );
  }
}

abstract class _RkoModel implements RkoModel {
  factory _RkoModel(
      {@JsonKey(name: 'items') final List<ListRkoModel> items,
      @JsonKey(name: 'items_count') final int itemsCount}) = _$RkoModelImpl;

  factory _RkoModel.fromJson(Map<String, dynamic> json) =
      _$RkoModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ListRkoModel> get items;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;
  @override
  @JsonKey(ignore: true)
  _$$RkoModelImplCopyWith<_$RkoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListRkoModel _$ListRkoModelFromJson(Map<String, dynamic> json) {
  return _ListRkoModel.fromJson(json);
}

/// @nodoc
mixin _$ListRkoModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_details')
  BankListDetailsModel? get bankDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'oper_day_here')
  RkoOperDateModel? get operDayHere => throw _privateConstructorUsedError;
  @JsonKey(name: 'oper_day_there')
  RkoOperDateModel? get operDayThere => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String get bankName => throw _privateConstructorUsedError;
  bool get best => throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  @JsonKey(name: 'for_ip')
  bool get forIp => throw _privateConstructorUsedError;
  @JsonKey(name: 'for_ooo')
  bool get forOoo => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_eq')
  int get minEq => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_online')
  bool get openingOnline => throw _privateConstructorUsedError;
  bool get popular => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_open')
  int get priceOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'rateNumber')
  int get rateNumber => throw _privateConstructorUsedError;
  List<RkoRatesListModel>? get rates => throw _privateConstructorUsedError;
  @JsonKey(name: 'ratesName')
  String get ratesName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref_link')
  String get refLink => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListRkoModelCopyWith<ListRkoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListRkoModelCopyWith<$Res> {
  factory $ListRkoModelCopyWith(
          ListRkoModel value, $Res Function(ListRkoModel) then) =
      _$ListRkoModelCopyWithImpl<$Res, ListRkoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
      @JsonKey(name: 'oper_day_here') RkoOperDateModel? operDayHere,
      @JsonKey(name: 'oper_day_there') RkoOperDateModel? operDayThere,
      @JsonKey(name: 'bank_name') String bankName,
      bool best,
      bool enable,
      List<String> features,
      @JsonKey(name: 'for_ip') bool forIp,
      @JsonKey(name: 'for_ooo') bool forOoo,
      @JsonKey(name: 'min_eq') int minEq,
      @JsonKey(name: 'opening_online') bool openingOnline,
      bool popular,
      @JsonKey(name: 'price_open') int priceOpen,
      @JsonKey(name: 'rateNumber') int rateNumber,
      List<RkoRatesListModel>? rates,
      @JsonKey(name: 'ratesName') String ratesName,
      @JsonKey(name: 'ref_link') String refLink,
      String slug});

  $BankListDetailsModelCopyWith<$Res>? get bankDetails;
  $RkoOperDateModelCopyWith<$Res>? get operDayHere;
  $RkoOperDateModelCopyWith<$Res>? get operDayThere;
}

/// @nodoc
class _$ListRkoModelCopyWithImpl<$Res, $Val extends ListRkoModel>
    implements $ListRkoModelCopyWith<$Res> {
  _$ListRkoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankDetails = freezed,
    Object? operDayHere = freezed,
    Object? operDayThere = freezed,
    Object? bankName = null,
    Object? best = null,
    Object? enable = null,
    Object? features = null,
    Object? forIp = null,
    Object? forOoo = null,
    Object? minEq = null,
    Object? openingOnline = null,
    Object? popular = null,
    Object? priceOpen = null,
    Object? rateNumber = null,
    Object? rates = freezed,
    Object? ratesName = null,
    Object? refLink = null,
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankDetails: freezed == bankDetails
          ? _value.bankDetails
          : bankDetails // ignore: cast_nullable_to_non_nullable
              as BankListDetailsModel?,
      operDayHere: freezed == operDayHere
          ? _value.operDayHere
          : operDayHere // ignore: cast_nullable_to_non_nullable
              as RkoOperDateModel?,
      operDayThere: freezed == operDayThere
          ? _value.operDayThere
          : operDayThere // ignore: cast_nullable_to_non_nullable
              as RkoOperDateModel?,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as bool,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      forIp: null == forIp
          ? _value.forIp
          : forIp // ignore: cast_nullable_to_non_nullable
              as bool,
      forOoo: null == forOoo
          ? _value.forOoo
          : forOoo // ignore: cast_nullable_to_non_nullable
              as bool,
      minEq: null == minEq
          ? _value.minEq
          : minEq // ignore: cast_nullable_to_non_nullable
              as int,
      openingOnline: null == openingOnline
          ? _value.openingOnline
          : openingOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOpen: null == priceOpen
          ? _value.priceOpen
          : priceOpen // ignore: cast_nullable_to_non_nullable
              as int,
      rateNumber: null == rateNumber
          ? _value.rateNumber
          : rateNumber // ignore: cast_nullable_to_non_nullable
              as int,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<RkoRatesListModel>?,
      ratesName: null == ratesName
          ? _value.ratesName
          : ratesName // ignore: cast_nullable_to_non_nullable
              as String,
      refLink: null == refLink
          ? _value.refLink
          : refLink // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankListDetailsModelCopyWith<$Res>? get bankDetails {
    if (_value.bankDetails == null) {
      return null;
    }

    return $BankListDetailsModelCopyWith<$Res>(_value.bankDetails!, (value) {
      return _then(_value.copyWith(bankDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RkoOperDateModelCopyWith<$Res>? get operDayHere {
    if (_value.operDayHere == null) {
      return null;
    }

    return $RkoOperDateModelCopyWith<$Res>(_value.operDayHere!, (value) {
      return _then(_value.copyWith(operDayHere: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RkoOperDateModelCopyWith<$Res>? get operDayThere {
    if (_value.operDayThere == null) {
      return null;
    }

    return $RkoOperDateModelCopyWith<$Res>(_value.operDayThere!, (value) {
      return _then(_value.copyWith(operDayThere: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListRkoModelImplCopyWith<$Res>
    implements $ListRkoModelCopyWith<$Res> {
  factory _$$ListRkoModelImplCopyWith(
          _$ListRkoModelImpl value, $Res Function(_$ListRkoModelImpl) then) =
      __$$ListRkoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
      @JsonKey(name: 'oper_day_here') RkoOperDateModel? operDayHere,
      @JsonKey(name: 'oper_day_there') RkoOperDateModel? operDayThere,
      @JsonKey(name: 'bank_name') String bankName,
      bool best,
      bool enable,
      List<String> features,
      @JsonKey(name: 'for_ip') bool forIp,
      @JsonKey(name: 'for_ooo') bool forOoo,
      @JsonKey(name: 'min_eq') int minEq,
      @JsonKey(name: 'opening_online') bool openingOnline,
      bool popular,
      @JsonKey(name: 'price_open') int priceOpen,
      @JsonKey(name: 'rateNumber') int rateNumber,
      List<RkoRatesListModel>? rates,
      @JsonKey(name: 'ratesName') String ratesName,
      @JsonKey(name: 'ref_link') String refLink,
      String slug});

  @override
  $BankListDetailsModelCopyWith<$Res>? get bankDetails;
  @override
  $RkoOperDateModelCopyWith<$Res>? get operDayHere;
  @override
  $RkoOperDateModelCopyWith<$Res>? get operDayThere;
}

/// @nodoc
class __$$ListRkoModelImplCopyWithImpl<$Res>
    extends _$ListRkoModelCopyWithImpl<$Res, _$ListRkoModelImpl>
    implements _$$ListRkoModelImplCopyWith<$Res> {
  __$$ListRkoModelImplCopyWithImpl(
      _$ListRkoModelImpl _value, $Res Function(_$ListRkoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankDetails = freezed,
    Object? operDayHere = freezed,
    Object? operDayThere = freezed,
    Object? bankName = null,
    Object? best = null,
    Object? enable = null,
    Object? features = null,
    Object? forIp = null,
    Object? forOoo = null,
    Object? minEq = null,
    Object? openingOnline = null,
    Object? popular = null,
    Object? priceOpen = null,
    Object? rateNumber = null,
    Object? rates = freezed,
    Object? ratesName = null,
    Object? refLink = null,
    Object? slug = null,
  }) {
    return _then(_$ListRkoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankDetails: freezed == bankDetails
          ? _value.bankDetails
          : bankDetails // ignore: cast_nullable_to_non_nullable
              as BankListDetailsModel?,
      operDayHere: freezed == operDayHere
          ? _value.operDayHere
          : operDayHere // ignore: cast_nullable_to_non_nullable
              as RkoOperDateModel?,
      operDayThere: freezed == operDayThere
          ? _value.operDayThere
          : operDayThere // ignore: cast_nullable_to_non_nullable
              as RkoOperDateModel?,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as bool,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      forIp: null == forIp
          ? _value.forIp
          : forIp // ignore: cast_nullable_to_non_nullable
              as bool,
      forOoo: null == forOoo
          ? _value.forOoo
          : forOoo // ignore: cast_nullable_to_non_nullable
              as bool,
      minEq: null == minEq
          ? _value.minEq
          : minEq // ignore: cast_nullable_to_non_nullable
              as int,
      openingOnline: null == openingOnline
          ? _value.openingOnline
          : openingOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOpen: null == priceOpen
          ? _value.priceOpen
          : priceOpen // ignore: cast_nullable_to_non_nullable
              as int,
      rateNumber: null == rateNumber
          ? _value.rateNumber
          : rateNumber // ignore: cast_nullable_to_non_nullable
              as int,
      rates: freezed == rates
          ? _value._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<RkoRatesListModel>?,
      ratesName: null == ratesName
          ? _value.ratesName
          : ratesName // ignore: cast_nullable_to_non_nullable
              as String,
      refLink: null == refLink
          ? _value.refLink
          : refLink // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListRkoModelImpl implements _ListRkoModel {
  _$ListRkoModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'bank_details') this.bankDetails,
      @JsonKey(name: 'oper_day_here') this.operDayHere,
      @JsonKey(name: 'oper_day_there') this.operDayThere,
      @JsonKey(name: 'bank_name') this.bankName = '',
      this.best = false,
      this.enable = false,
      final List<String> features = const [],
      @JsonKey(name: 'for_ip') this.forIp = false,
      @JsonKey(name: 'for_ooo') this.forOoo = false,
      @JsonKey(name: 'min_eq') this.minEq = 0,
      @JsonKey(name: 'opening_online') this.openingOnline = false,
      this.popular = false,
      @JsonKey(name: 'price_open') this.priceOpen = 0,
      @JsonKey(name: 'rateNumber') this.rateNumber = 0,
      final List<RkoRatesListModel>? rates,
      @JsonKey(name: 'ratesName') this.ratesName = '',
      @JsonKey(name: 'ref_link') this.refLink = '',
      this.slug = ''})
      : _features = features,
        _rates = rates;

  factory _$ListRkoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListRkoModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'bank_details')
  final BankListDetailsModel? bankDetails;
  @override
  @JsonKey(name: 'oper_day_here')
  final RkoOperDateModel? operDayHere;
  @override
  @JsonKey(name: 'oper_day_there')
  final RkoOperDateModel? operDayThere;
  @override
  @JsonKey(name: 'bank_name')
  final String bankName;
  @override
  @JsonKey()
  final bool best;
  @override
  @JsonKey()
  final bool enable;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey(name: 'for_ip')
  final bool forIp;
  @override
  @JsonKey(name: 'for_ooo')
  final bool forOoo;
  @override
  @JsonKey(name: 'min_eq')
  final int minEq;
  @override
  @JsonKey(name: 'opening_online')
  final bool openingOnline;
  @override
  @JsonKey()
  final bool popular;
  @override
  @JsonKey(name: 'price_open')
  final int priceOpen;
  @override
  @JsonKey(name: 'rateNumber')
  final int rateNumber;
  final List<RkoRatesListModel>? _rates;
  @override
  List<RkoRatesListModel>? get rates {
    final value = _rates;
    if (value == null) return null;
    if (_rates is EqualUnmodifiableListView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ratesName')
  final String ratesName;
  @override
  @JsonKey(name: 'ref_link')
  final String refLink;
  @override
  @JsonKey()
  final String slug;

  @override
  String toString() {
    return 'ListRkoModel(id: $id, bankDetails: $bankDetails, operDayHere: $operDayHere, operDayThere: $operDayThere, bankName: $bankName, best: $best, enable: $enable, features: $features, forIp: $forIp, forOoo: $forOoo, minEq: $minEq, openingOnline: $openingOnline, popular: $popular, priceOpen: $priceOpen, rateNumber: $rateNumber, rates: $rates, ratesName: $ratesName, refLink: $refLink, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListRkoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankDetails, bankDetails) ||
                other.bankDetails == bankDetails) &&
            (identical(other.operDayHere, operDayHere) ||
                other.operDayHere == operDayHere) &&
            (identical(other.operDayThere, operDayThere) ||
                other.operDayThere == operDayThere) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.best, best) || other.best == best) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.forIp, forIp) || other.forIp == forIp) &&
            (identical(other.forOoo, forOoo) || other.forOoo == forOoo) &&
            (identical(other.minEq, minEq) || other.minEq == minEq) &&
            (identical(other.openingOnline, openingOnline) ||
                other.openingOnline == openingOnline) &&
            (identical(other.popular, popular) || other.popular == popular) &&
            (identical(other.priceOpen, priceOpen) ||
                other.priceOpen == priceOpen) &&
            (identical(other.rateNumber, rateNumber) ||
                other.rateNumber == rateNumber) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.ratesName, ratesName) ||
                other.ratesName == ratesName) &&
            (identical(other.refLink, refLink) || other.refLink == refLink) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        bankDetails,
        operDayHere,
        operDayThere,
        bankName,
        best,
        enable,
        const DeepCollectionEquality().hash(_features),
        forIp,
        forOoo,
        minEq,
        openingOnline,
        popular,
        priceOpen,
        rateNumber,
        const DeepCollectionEquality().hash(_rates),
        ratesName,
        refLink,
        slug
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListRkoModelImplCopyWith<_$ListRkoModelImpl> get copyWith =>
      __$$ListRkoModelImplCopyWithImpl<_$ListRkoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListRkoModelImplToJson(
      this,
    );
  }
}

abstract class _ListRkoModel implements ListRkoModel {
  factory _ListRkoModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'bank_details') final BankListDetailsModel? bankDetails,
      @JsonKey(name: 'oper_day_here') final RkoOperDateModel? operDayHere,
      @JsonKey(name: 'oper_day_there') final RkoOperDateModel? operDayThere,
      @JsonKey(name: 'bank_name') final String bankName,
      final bool best,
      final bool enable,
      final List<String> features,
      @JsonKey(name: 'for_ip') final bool forIp,
      @JsonKey(name: 'for_ooo') final bool forOoo,
      @JsonKey(name: 'min_eq') final int minEq,
      @JsonKey(name: 'opening_online') final bool openingOnline,
      final bool popular,
      @JsonKey(name: 'price_open') final int priceOpen,
      @JsonKey(name: 'rateNumber') final int rateNumber,
      final List<RkoRatesListModel>? rates,
      @JsonKey(name: 'ratesName') final String ratesName,
      @JsonKey(name: 'ref_link') final String refLink,
      final String slug}) = _$ListRkoModelImpl;

  factory _ListRkoModel.fromJson(Map<String, dynamic> json) =
      _$ListRkoModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'bank_details')
  BankListDetailsModel? get bankDetails;
  @override
  @JsonKey(name: 'oper_day_here')
  RkoOperDateModel? get operDayHere;
  @override
  @JsonKey(name: 'oper_day_there')
  RkoOperDateModel? get operDayThere;
  @override
  @JsonKey(name: 'bank_name')
  String get bankName;
  @override
  bool get best;
  @override
  bool get enable;
  @override
  List<String> get features;
  @override
  @JsonKey(name: 'for_ip')
  bool get forIp;
  @override
  @JsonKey(name: 'for_ooo')
  bool get forOoo;
  @override
  @JsonKey(name: 'min_eq')
  int get minEq;
  @override
  @JsonKey(name: 'opening_online')
  bool get openingOnline;
  @override
  bool get popular;
  @override
  @JsonKey(name: 'price_open')
  int get priceOpen;
  @override
  @JsonKey(name: 'rateNumber')
  int get rateNumber;
  @override
  List<RkoRatesListModel>? get rates;
  @override
  @JsonKey(name: 'ratesName')
  String get ratesName;
  @override
  @JsonKey(name: 'ref_link')
  String get refLink;
  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$ListRkoModelImplCopyWith<_$ListRkoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RkoOperDateModel _$RkoOperDateModelFromJson(Map<String, dynamic> json) {
  return _RkoOperDateModel.fromJson(json);
}

/// @nodoc
mixin _$RkoOperDateModel {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RkoOperDateModelCopyWith<RkoOperDateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RkoOperDateModelCopyWith<$Res> {
  factory $RkoOperDateModelCopyWith(
          RkoOperDateModel value, $Res Function(RkoOperDateModel) then) =
      _$RkoOperDateModelCopyWithImpl<$Res, RkoOperDateModel>;
  @useResult
  $Res call({String from, String to});
}

/// @nodoc
class _$RkoOperDateModelCopyWithImpl<$Res, $Val extends RkoOperDateModel>
    implements $RkoOperDateModelCopyWith<$Res> {
  _$RkoOperDateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RkoOperDateModelImplCopyWith<$Res>
    implements $RkoOperDateModelCopyWith<$Res> {
  factory _$$RkoOperDateModelImplCopyWith(_$RkoOperDateModelImpl value,
          $Res Function(_$RkoOperDateModelImpl) then) =
      __$$RkoOperDateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to});
}

/// @nodoc
class __$$RkoOperDateModelImplCopyWithImpl<$Res>
    extends _$RkoOperDateModelCopyWithImpl<$Res, _$RkoOperDateModelImpl>
    implements _$$RkoOperDateModelImplCopyWith<$Res> {
  __$$RkoOperDateModelImplCopyWithImpl(_$RkoOperDateModelImpl _value,
      $Res Function(_$RkoOperDateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$RkoOperDateModelImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RkoOperDateModelImpl implements _RkoOperDateModel {
  _$RkoOperDateModelImpl({this.from = '', this.to = ''});

  factory _$RkoOperDateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RkoOperDateModelImplFromJson(json);

  @override
  @JsonKey()
  final String from;
  @override
  @JsonKey()
  final String to;

  @override
  String toString() {
    return 'RkoOperDateModel(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RkoOperDateModelImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RkoOperDateModelImplCopyWith<_$RkoOperDateModelImpl> get copyWith =>
      __$$RkoOperDateModelImplCopyWithImpl<_$RkoOperDateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RkoOperDateModelImplToJson(
      this,
    );
  }
}

abstract class _RkoOperDateModel implements RkoOperDateModel {
  factory _RkoOperDateModel({final String from, final String to}) =
      _$RkoOperDateModelImpl;

  factory _RkoOperDateModel.fromJson(Map<String, dynamic> json) =
      _$RkoOperDateModelImpl.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  @JsonKey(ignore: true)
  _$$RkoOperDateModelImplCopyWith<_$RkoOperDateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RkoRatesListModel _$RkoRatesListModelFromJson(Map<String, dynamic> json) {
  return _RkoRatesListModel.fromJson(json);
}

/// @nodoc
mixin _$RkoRatesListModel {
  @JsonKey(name: 'all_conditions_link')
  String get allConditionsLink => throw _privateConstructorUsedError;
  bool get credits => throw _privateConstructorUsedError;
  @JsonKey(name: 'credits_text')
  String get creditsText => throw _privateConstructorUsedError;
  bool get deposits => throw _privateConstructorUsedError;
  @JsonKey(name: 'deposits_text')
  String get depositsText => throw _privateConstructorUsedError;
  @JsonKey(name: 'descriptions')
  RkoRatesDescriptionsModel? get descriptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'free_transfers_ur')
  String get freeTransfersUr => throw _privateConstructorUsedError;
  bool get government => throw _privateConstructorUsedError;
  @JsonKey(name: 'interest_on_balance')
  bool get interestOnBalance => throw _privateConstructorUsedError;
  dynamic get main => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'online_accounting')
  bool get onlineAccounting => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_transfers_ur')
  int get priceTransfersUr => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_1_month')
  dynamic get service1Month => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_1_year')
  dynamic get service1Year => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_3_month')
  dynamic get service3Month => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_6_month')
  dynamic get service6Month => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_forever')
  dynamic get serviceForever => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RkoRatesListModelCopyWith<RkoRatesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RkoRatesListModelCopyWith<$Res> {
  factory $RkoRatesListModelCopyWith(
          RkoRatesListModel value, $Res Function(RkoRatesListModel) then) =
      _$RkoRatesListModelCopyWithImpl<$Res, RkoRatesListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'all_conditions_link') String allConditionsLink,
      bool credits,
      @JsonKey(name: 'credits_text') String creditsText,
      bool deposits,
      @JsonKey(name: 'deposits_text') String depositsText,
      @JsonKey(name: 'descriptions') RkoRatesDescriptionsModel? descriptions,
      @JsonKey(name: 'free_transfers_ur') String freeTransfersUr,
      bool government,
      @JsonKey(name: 'interest_on_balance') bool interestOnBalance,
      dynamic main,
      String name,
      @JsonKey(name: 'online_accounting') bool onlineAccounting,
      @JsonKey(name: 'price_transfers_ur') int priceTransfersUr,
      @JsonKey(name: 'service_1_month') dynamic service1Month,
      @JsonKey(name: 'service_1_year') dynamic service1Year,
      @JsonKey(name: 'service_3_month') dynamic service3Month,
      @JsonKey(name: 'service_6_month') dynamic service6Month,
      @JsonKey(name: 'service_forever') dynamic serviceForever});

  $RkoRatesDescriptionsModelCopyWith<$Res>? get descriptions;
}

/// @nodoc
class _$RkoRatesListModelCopyWithImpl<$Res, $Val extends RkoRatesListModel>
    implements $RkoRatesListModelCopyWith<$Res> {
  _$RkoRatesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allConditionsLink = null,
    Object? credits = null,
    Object? creditsText = null,
    Object? deposits = null,
    Object? depositsText = null,
    Object? descriptions = freezed,
    Object? freeTransfersUr = null,
    Object? government = null,
    Object? interestOnBalance = null,
    Object? main = freezed,
    Object? name = null,
    Object? onlineAccounting = null,
    Object? priceTransfersUr = null,
    Object? service1Month = freezed,
    Object? service1Year = freezed,
    Object? service3Month = freezed,
    Object? service6Month = freezed,
    Object? serviceForever = freezed,
  }) {
    return _then(_value.copyWith(
      allConditionsLink: null == allConditionsLink
          ? _value.allConditionsLink
          : allConditionsLink // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as bool,
      creditsText: null == creditsText
          ? _value.creditsText
          : creditsText // ignore: cast_nullable_to_non_nullable
              as String,
      deposits: null == deposits
          ? _value.deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as bool,
      depositsText: null == depositsText
          ? _value.depositsText
          : depositsText // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as RkoRatesDescriptionsModel?,
      freeTransfersUr: null == freeTransfersUr
          ? _value.freeTransfersUr
          : freeTransfersUr // ignore: cast_nullable_to_non_nullable
              as String,
      government: null == government
          ? _value.government
          : government // ignore: cast_nullable_to_non_nullable
              as bool,
      interestOnBalance: null == interestOnBalance
          ? _value.interestOnBalance
          : interestOnBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      onlineAccounting: null == onlineAccounting
          ? _value.onlineAccounting
          : onlineAccounting // ignore: cast_nullable_to_non_nullable
              as bool,
      priceTransfersUr: null == priceTransfersUr
          ? _value.priceTransfersUr
          : priceTransfersUr // ignore: cast_nullable_to_non_nullable
              as int,
      service1Month: freezed == service1Month
          ? _value.service1Month
          : service1Month // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service1Year: freezed == service1Year
          ? _value.service1Year
          : service1Year // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service3Month: freezed == service3Month
          ? _value.service3Month
          : service3Month // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service6Month: freezed == service6Month
          ? _value.service6Month
          : service6Month // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceForever: freezed == serviceForever
          ? _value.serviceForever
          : serviceForever // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RkoRatesDescriptionsModelCopyWith<$Res>? get descriptions {
    if (_value.descriptions == null) {
      return null;
    }

    return $RkoRatesDescriptionsModelCopyWith<$Res>(_value.descriptions!,
        (value) {
      return _then(_value.copyWith(descriptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RkoRatesListModelImplCopyWith<$Res>
    implements $RkoRatesListModelCopyWith<$Res> {
  factory _$$RkoRatesListModelImplCopyWith(_$RkoRatesListModelImpl value,
          $Res Function(_$RkoRatesListModelImpl) then) =
      __$$RkoRatesListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'all_conditions_link') String allConditionsLink,
      bool credits,
      @JsonKey(name: 'credits_text') String creditsText,
      bool deposits,
      @JsonKey(name: 'deposits_text') String depositsText,
      @JsonKey(name: 'descriptions') RkoRatesDescriptionsModel? descriptions,
      @JsonKey(name: 'free_transfers_ur') String freeTransfersUr,
      bool government,
      @JsonKey(name: 'interest_on_balance') bool interestOnBalance,
      dynamic main,
      String name,
      @JsonKey(name: 'online_accounting') bool onlineAccounting,
      @JsonKey(name: 'price_transfers_ur') int priceTransfersUr,
      @JsonKey(name: 'service_1_month') dynamic service1Month,
      @JsonKey(name: 'service_1_year') dynamic service1Year,
      @JsonKey(name: 'service_3_month') dynamic service3Month,
      @JsonKey(name: 'service_6_month') dynamic service6Month,
      @JsonKey(name: 'service_forever') dynamic serviceForever});

  @override
  $RkoRatesDescriptionsModelCopyWith<$Res>? get descriptions;
}

/// @nodoc
class __$$RkoRatesListModelImplCopyWithImpl<$Res>
    extends _$RkoRatesListModelCopyWithImpl<$Res, _$RkoRatesListModelImpl>
    implements _$$RkoRatesListModelImplCopyWith<$Res> {
  __$$RkoRatesListModelImplCopyWithImpl(_$RkoRatesListModelImpl _value,
      $Res Function(_$RkoRatesListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allConditionsLink = null,
    Object? credits = null,
    Object? creditsText = null,
    Object? deposits = null,
    Object? depositsText = null,
    Object? descriptions = freezed,
    Object? freeTransfersUr = null,
    Object? government = null,
    Object? interestOnBalance = null,
    Object? main = freezed,
    Object? name = null,
    Object? onlineAccounting = null,
    Object? priceTransfersUr = null,
    Object? service1Month = freezed,
    Object? service1Year = freezed,
    Object? service3Month = freezed,
    Object? service6Month = freezed,
    Object? serviceForever = freezed,
  }) {
    return _then(_$RkoRatesListModelImpl(
      allConditionsLink: null == allConditionsLink
          ? _value.allConditionsLink
          : allConditionsLink // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as bool,
      creditsText: null == creditsText
          ? _value.creditsText
          : creditsText // ignore: cast_nullable_to_non_nullable
              as String,
      deposits: null == deposits
          ? _value.deposits
          : deposits // ignore: cast_nullable_to_non_nullable
              as bool,
      depositsText: null == depositsText
          ? _value.depositsText
          : depositsText // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as RkoRatesDescriptionsModel?,
      freeTransfersUr: null == freeTransfersUr
          ? _value.freeTransfersUr
          : freeTransfersUr // ignore: cast_nullable_to_non_nullable
              as String,
      government: null == government
          ? _value.government
          : government // ignore: cast_nullable_to_non_nullable
              as bool,
      interestOnBalance: null == interestOnBalance
          ? _value.interestOnBalance
          : interestOnBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      onlineAccounting: null == onlineAccounting
          ? _value.onlineAccounting
          : onlineAccounting // ignore: cast_nullable_to_non_nullable
              as bool,
      priceTransfersUr: null == priceTransfersUr
          ? _value.priceTransfersUr
          : priceTransfersUr // ignore: cast_nullable_to_non_nullable
              as int,
      service1Month: freezed == service1Month
          ? _value.service1Month
          : service1Month // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service1Year: freezed == service1Year
          ? _value.service1Year
          : service1Year // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service3Month: freezed == service3Month
          ? _value.service3Month
          : service3Month // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service6Month: freezed == service6Month
          ? _value.service6Month
          : service6Month // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceForever: freezed == serviceForever
          ? _value.serviceForever
          : serviceForever // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RkoRatesListModelImpl implements _RkoRatesListModel {
  _$RkoRatesListModelImpl(
      {@JsonKey(name: 'all_conditions_link') this.allConditionsLink = '',
      this.credits = false,
      @JsonKey(name: 'credits_text') this.creditsText = '',
      this.deposits = false,
      @JsonKey(name: 'deposits_text') this.depositsText = '',
      @JsonKey(name: 'descriptions') this.descriptions,
      @JsonKey(name: 'free_transfers_ur') this.freeTransfersUr = '',
      this.government = false,
      @JsonKey(name: 'interest_on_balance') this.interestOnBalance = false,
      this.main = 0,
      this.name = '',
      @JsonKey(name: 'online_accounting') this.onlineAccounting = false,
      @JsonKey(name: 'price_transfers_ur') this.priceTransfersUr = 0,
      @JsonKey(name: 'service_1_month') this.service1Month = 0,
      @JsonKey(name: 'service_1_year') this.service1Year = 0,
      @JsonKey(name: 'service_3_month') this.service3Month = 0,
      @JsonKey(name: 'service_6_month') this.service6Month = 0,
      @JsonKey(name: 'service_forever') this.serviceForever = 0});

  factory _$RkoRatesListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RkoRatesListModelImplFromJson(json);

  @override
  @JsonKey(name: 'all_conditions_link')
  final String allConditionsLink;
  @override
  @JsonKey()
  final bool credits;
  @override
  @JsonKey(name: 'credits_text')
  final String creditsText;
  @override
  @JsonKey()
  final bool deposits;
  @override
  @JsonKey(name: 'deposits_text')
  final String depositsText;
  @override
  @JsonKey(name: 'descriptions')
  final RkoRatesDescriptionsModel? descriptions;
  @override
  @JsonKey(name: 'free_transfers_ur')
  final String freeTransfersUr;
  @override
  @JsonKey()
  final bool government;
  @override
  @JsonKey(name: 'interest_on_balance')
  final bool interestOnBalance;
  @override
  @JsonKey()
  final dynamic main;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'online_accounting')
  final bool onlineAccounting;
  @override
  @JsonKey(name: 'price_transfers_ur')
  final int priceTransfersUr;
  @override
  @JsonKey(name: 'service_1_month')
  final dynamic service1Month;
  @override
  @JsonKey(name: 'service_1_year')
  final dynamic service1Year;
  @override
  @JsonKey(name: 'service_3_month')
  final dynamic service3Month;
  @override
  @JsonKey(name: 'service_6_month')
  final dynamic service6Month;
  @override
  @JsonKey(name: 'service_forever')
  final dynamic serviceForever;

  @override
  String toString() {
    return 'RkoRatesListModel(allConditionsLink: $allConditionsLink, credits: $credits, creditsText: $creditsText, deposits: $deposits, depositsText: $depositsText, descriptions: $descriptions, freeTransfersUr: $freeTransfersUr, government: $government, interestOnBalance: $interestOnBalance, main: $main, name: $name, onlineAccounting: $onlineAccounting, priceTransfersUr: $priceTransfersUr, service1Month: $service1Month, service1Year: $service1Year, service3Month: $service3Month, service6Month: $service6Month, serviceForever: $serviceForever)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RkoRatesListModelImpl &&
            (identical(other.allConditionsLink, allConditionsLink) ||
                other.allConditionsLink == allConditionsLink) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.creditsText, creditsText) ||
                other.creditsText == creditsText) &&
            (identical(other.deposits, deposits) ||
                other.deposits == deposits) &&
            (identical(other.depositsText, depositsText) ||
                other.depositsText == depositsText) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            (identical(other.freeTransfersUr, freeTransfersUr) ||
                other.freeTransfersUr == freeTransfersUr) &&
            (identical(other.government, government) ||
                other.government == government) &&
            (identical(other.interestOnBalance, interestOnBalance) ||
                other.interestOnBalance == interestOnBalance) &&
            const DeepCollectionEquality().equals(other.main, main) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.onlineAccounting, onlineAccounting) ||
                other.onlineAccounting == onlineAccounting) &&
            (identical(other.priceTransfersUr, priceTransfersUr) ||
                other.priceTransfersUr == priceTransfersUr) &&
            const DeepCollectionEquality()
                .equals(other.service1Month, service1Month) &&
            const DeepCollectionEquality()
                .equals(other.service1Year, service1Year) &&
            const DeepCollectionEquality()
                .equals(other.service3Month, service3Month) &&
            const DeepCollectionEquality()
                .equals(other.service6Month, service6Month) &&
            const DeepCollectionEquality()
                .equals(other.serviceForever, serviceForever));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      allConditionsLink,
      credits,
      creditsText,
      deposits,
      depositsText,
      descriptions,
      freeTransfersUr,
      government,
      interestOnBalance,
      const DeepCollectionEquality().hash(main),
      name,
      onlineAccounting,
      priceTransfersUr,
      const DeepCollectionEquality().hash(service1Month),
      const DeepCollectionEquality().hash(service1Year),
      const DeepCollectionEquality().hash(service3Month),
      const DeepCollectionEquality().hash(service6Month),
      const DeepCollectionEquality().hash(serviceForever));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RkoRatesListModelImplCopyWith<_$RkoRatesListModelImpl> get copyWith =>
      __$$RkoRatesListModelImplCopyWithImpl<_$RkoRatesListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RkoRatesListModelImplToJson(
      this,
    );
  }
}

abstract class _RkoRatesListModel implements RkoRatesListModel {
  factory _RkoRatesListModel(
          {@JsonKey(name: 'all_conditions_link') final String allConditionsLink,
          final bool credits,
          @JsonKey(name: 'credits_text') final String creditsText,
          final bool deposits,
          @JsonKey(name: 'deposits_text') final String depositsText,
          @JsonKey(name: 'descriptions')
          final RkoRatesDescriptionsModel? descriptions,
          @JsonKey(name: 'free_transfers_ur') final String freeTransfersUr,
          final bool government,
          @JsonKey(name: 'interest_on_balance') final bool interestOnBalance,
          final dynamic main,
          final String name,
          @JsonKey(name: 'online_accounting') final bool onlineAccounting,
          @JsonKey(name: 'price_transfers_ur') final int priceTransfersUr,
          @JsonKey(name: 'service_1_month') final dynamic service1Month,
          @JsonKey(name: 'service_1_year') final dynamic service1Year,
          @JsonKey(name: 'service_3_month') final dynamic service3Month,
          @JsonKey(name: 'service_6_month') final dynamic service6Month,
          @JsonKey(name: 'service_forever') final dynamic serviceForever}) =
      _$RkoRatesListModelImpl;

  factory _RkoRatesListModel.fromJson(Map<String, dynamic> json) =
      _$RkoRatesListModelImpl.fromJson;

  @override
  @JsonKey(name: 'all_conditions_link')
  String get allConditionsLink;
  @override
  bool get credits;
  @override
  @JsonKey(name: 'credits_text')
  String get creditsText;
  @override
  bool get deposits;
  @override
  @JsonKey(name: 'deposits_text')
  String get depositsText;
  @override
  @JsonKey(name: 'descriptions')
  RkoRatesDescriptionsModel? get descriptions;
  @override
  @JsonKey(name: 'free_transfers_ur')
  String get freeTransfersUr;
  @override
  bool get government;
  @override
  @JsonKey(name: 'interest_on_balance')
  bool get interestOnBalance;
  @override
  dynamic get main;
  @override
  String get name;
  @override
  @JsonKey(name: 'online_accounting')
  bool get onlineAccounting;
  @override
  @JsonKey(name: 'price_transfers_ur')
  int get priceTransfersUr;
  @override
  @JsonKey(name: 'service_1_month')
  dynamic get service1Month;
  @override
  @JsonKey(name: 'service_1_year')
  dynamic get service1Year;
  @override
  @JsonKey(name: 'service_3_month')
  dynamic get service3Month;
  @override
  @JsonKey(name: 'service_6_month')
  dynamic get service6Month;
  @override
  @JsonKey(name: 'service_forever')
  dynamic get serviceForever;
  @override
  @JsonKey(ignore: true)
  _$$RkoRatesListModelImplCopyWith<_$RkoRatesListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RkoRatesDescriptionsModel _$RkoRatesDescriptionsModelFromJson(
    Map<String, dynamic> json) {
  return _RkoRatesDescriptionsModel.fromJson(json);
}

/// @nodoc
mixin _$RkoRatesDescriptionsModel {
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_commission')
  String get transferCommission => throw _privateConstructorUsedError;
  @JsonKey(name: 'stocks')
  String get stocks => throw _privateConstructorUsedError;
  @JsonKey(name: 'deposit_cash')
  String get depositCash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RkoRatesDescriptionsModelCopyWith<RkoRatesDescriptionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RkoRatesDescriptionsModelCopyWith<$Res> {
  factory $RkoRatesDescriptionsModelCopyWith(RkoRatesDescriptionsModel value,
          $Res Function(RkoRatesDescriptionsModel) then) =
      _$RkoRatesDescriptionsModelCopyWithImpl<$Res, RkoRatesDescriptionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      @JsonKey(name: 'transfer_commission') String transferCommission,
      @JsonKey(name: 'stocks') String stocks,
      @JsonKey(name: 'deposit_cash') String depositCash});
}

/// @nodoc
class _$RkoRatesDescriptionsModelCopyWithImpl<$Res,
        $Val extends RkoRatesDescriptionsModel>
    implements $RkoRatesDescriptionsModelCopyWith<$Res> {
  _$RkoRatesDescriptionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashWithdrawal = null,
    Object? transferCommission = null,
    Object? stocks = null,
    Object? depositCash = null,
  }) {
    return _then(_value.copyWith(
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      transferCommission: null == transferCommission
          ? _value.transferCommission
          : transferCommission // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as String,
      depositCash: null == depositCash
          ? _value.depositCash
          : depositCash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RkoRatesDescriptionsModelImplCopyWith<$Res>
    implements $RkoRatesDescriptionsModelCopyWith<$Res> {
  factory _$$RkoRatesDescriptionsModelImplCopyWith(
          _$RkoRatesDescriptionsModelImpl value,
          $Res Function(_$RkoRatesDescriptionsModelImpl) then) =
      __$$RkoRatesDescriptionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      @JsonKey(name: 'transfer_commission') String transferCommission,
      @JsonKey(name: 'stocks') String stocks,
      @JsonKey(name: 'deposit_cash') String depositCash});
}

/// @nodoc
class __$$RkoRatesDescriptionsModelImplCopyWithImpl<$Res>
    extends _$RkoRatesDescriptionsModelCopyWithImpl<$Res,
        _$RkoRatesDescriptionsModelImpl>
    implements _$$RkoRatesDescriptionsModelImplCopyWith<$Res> {
  __$$RkoRatesDescriptionsModelImplCopyWithImpl(
      _$RkoRatesDescriptionsModelImpl _value,
      $Res Function(_$RkoRatesDescriptionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashWithdrawal = null,
    Object? transferCommission = null,
    Object? stocks = null,
    Object? depositCash = null,
  }) {
    return _then(_$RkoRatesDescriptionsModelImpl(
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      transferCommission: null == transferCommission
          ? _value.transferCommission
          : transferCommission // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as String,
      depositCash: null == depositCash
          ? _value.depositCash
          : depositCash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RkoRatesDescriptionsModelImpl implements _RkoRatesDescriptionsModel {
  _$RkoRatesDescriptionsModelImpl(
      {@JsonKey(name: 'cash_withdrawal') this.cashWithdrawal = '',
      @JsonKey(name: 'transfer_commission') this.transferCommission = '',
      @JsonKey(name: 'stocks') this.stocks = '',
      @JsonKey(name: 'deposit_cash') this.depositCash = ''});

  factory _$RkoRatesDescriptionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RkoRatesDescriptionsModelImplFromJson(json);

  @override
  @JsonKey(name: 'cash_withdrawal')
  final String cashWithdrawal;
  @override
  @JsonKey(name: 'transfer_commission')
  final String transferCommission;
  @override
  @JsonKey(name: 'stocks')
  final String stocks;
  @override
  @JsonKey(name: 'deposit_cash')
  final String depositCash;

  @override
  String toString() {
    return 'RkoRatesDescriptionsModel(cashWithdrawal: $cashWithdrawal, transferCommission: $transferCommission, stocks: $stocks, depositCash: $depositCash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RkoRatesDescriptionsModelImpl &&
            (identical(other.cashWithdrawal, cashWithdrawal) ||
                other.cashWithdrawal == cashWithdrawal) &&
            (identical(other.transferCommission, transferCommission) ||
                other.transferCommission == transferCommission) &&
            (identical(other.stocks, stocks) || other.stocks == stocks) &&
            (identical(other.depositCash, depositCash) ||
                other.depositCash == depositCash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cashWithdrawal, transferCommission, stocks, depositCash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RkoRatesDescriptionsModelImplCopyWith<_$RkoRatesDescriptionsModelImpl>
      get copyWith => __$$RkoRatesDescriptionsModelImplCopyWithImpl<
          _$RkoRatesDescriptionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RkoRatesDescriptionsModelImplToJson(
      this,
    );
  }
}

abstract class _RkoRatesDescriptionsModel implements RkoRatesDescriptionsModel {
  factory _RkoRatesDescriptionsModel(
          {@JsonKey(name: 'cash_withdrawal') final String cashWithdrawal,
          @JsonKey(name: 'transfer_commission') final String transferCommission,
          @JsonKey(name: 'stocks') final String stocks,
          @JsonKey(name: 'deposit_cash') final String depositCash}) =
      _$RkoRatesDescriptionsModelImpl;

  factory _RkoRatesDescriptionsModel.fromJson(Map<String, dynamic> json) =
      _$RkoRatesDescriptionsModelImpl.fromJson;

  @override
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal;
  @override
  @JsonKey(name: 'transfer_commission')
  String get transferCommission;
  @override
  @JsonKey(name: 'stocks')
  String get stocks;
  @override
  @JsonKey(name: 'deposit_cash')
  String get depositCash;
  @override
  @JsonKey(ignore: true)
  _$$RkoRatesDescriptionsModelImplCopyWith<_$RkoRatesDescriptionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
