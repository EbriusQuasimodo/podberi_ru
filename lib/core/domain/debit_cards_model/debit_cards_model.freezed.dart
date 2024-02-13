// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debit_cards_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DebitCardsModel _$DebitCardsModelFromJson(Map<String, dynamic> json) {
  return _DebitCardsModel.fromJson(json);
}

/// @nodoc
mixin _$DebitCardsModel {
  @JsonKey(name: 'items')
  List<ListDebitCardsModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DebitCardsModelCopyWith<DebitCardsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebitCardsModelCopyWith<$Res> {
  factory $DebitCardsModelCopyWith(
          DebitCardsModel value, $Res Function(DebitCardsModel) then) =
      _$DebitCardsModelCopyWithImpl<$Res, DebitCardsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListDebitCardsModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class _$DebitCardsModelCopyWithImpl<$Res, $Val extends DebitCardsModel>
    implements $DebitCardsModelCopyWith<$Res> {
  _$DebitCardsModelCopyWithImpl(this._value, this._then);

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
              as List<ListDebitCardsModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebitCardsModelImplCopyWith<$Res>
    implements $DebitCardsModelCopyWith<$Res> {
  factory _$$DebitCardsModelImplCopyWith(_$DebitCardsModelImpl value,
          $Res Function(_$DebitCardsModelImpl) then) =
      __$$DebitCardsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListDebitCardsModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class __$$DebitCardsModelImplCopyWithImpl<$Res>
    extends _$DebitCardsModelCopyWithImpl<$Res, _$DebitCardsModelImpl>
    implements _$$DebitCardsModelImplCopyWith<$Res> {
  __$$DebitCardsModelImplCopyWithImpl(
      _$DebitCardsModelImpl _value, $Res Function(_$DebitCardsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? itemsCount = null,
  }) {
    return _then(_$DebitCardsModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListDebitCardsModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebitCardsModelImpl implements _DebitCardsModel {
  _$DebitCardsModelImpl(
      {@JsonKey(name: 'items') final List<ListDebitCardsModel> items = const [],
      @JsonKey(name: 'items_count') this.itemsCount = 0})
      : _items = items;

  factory _$DebitCardsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DebitCardsModelImplFromJson(json);

  final List<ListDebitCardsModel> _items;
  @override
  @JsonKey(name: 'items')
  List<ListDebitCardsModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;

  @override
  String toString() {
    return 'DebitCardsModel(items: $items, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebitCardsModelImpl &&
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
  _$$DebitCardsModelImplCopyWith<_$DebitCardsModelImpl> get copyWith =>
      __$$DebitCardsModelImplCopyWithImpl<_$DebitCardsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebitCardsModelImplToJson(
      this,
    );
  }
}

abstract class _DebitCardsModel implements DebitCardsModel {
  factory _DebitCardsModel(
          {@JsonKey(name: 'items') final List<ListDebitCardsModel> items,
          @JsonKey(name: 'items_count') final int itemsCount}) =
      _$DebitCardsModelImpl;

  factory _DebitCardsModel.fromJson(Map<String, dynamic> json) =
      _$DebitCardsModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ListDebitCardsModel> get items;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;
  @override
  @JsonKey(ignore: true)
  _$$DebitCardsModelImplCopyWith<_$DebitCardsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListDebitCardsModel _$ListDebitCardsModelFromJson(Map<String, dynamic> json) {
  return _ListDebitCardsModel.fromJson(json);
}

/// @nodoc
mixin _$ListDebitCardsModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'all_conditions_link')
  String get allConditionsLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_details')
  BankListDetailsModel? get bankDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String get bankName => throw _privateConstructorUsedError;
  bool get best => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_other_banks')
  bool get cashOtherBanks => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashback_format')
  String get cashbackFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'citizenship_russia')
  bool get citizenshipRussia => throw _privateConstructorUsedError;
  DebitCardsConditionsModel? get conditions =>
      throw _privateConstructorUsedError;
  String get currencies => throw _privateConstructorUsedError;
  bool get delivery => throw _privateConstructorUsedError;
  DebitCardsDescriptionsModel? get descriptions =>
      throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  @JsonKey(name: 'for_children')
  bool get forChildren => throw _privateConstructorUsedError;
  @JsonKey(name: 'for_minors')
  bool get forMinors => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'interest_on_balance')
  dynamic get interestOnBalance => throw _privateConstructorUsedError;
  int get issue => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_age')
  int get maxAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_cashback')
  String get maxCashBack => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_cashback_percent')
  int get maxCashbackPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_service')
  dynamic get maxService => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_sms')
  int get maxSms => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_age')
  int get minAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_service')
  dynamic get minService => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_sms')
  int get minSms => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get overdraft => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_system')
  String get paymentSystem => throw _privateConstructorUsedError;
  bool get popular => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref_link')
  String get refLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'reg_russia')
  bool get regRussia => throw _privateConstructorUsedError;
  int get reissue => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListDebitCardsModelCopyWith<ListDebitCardsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListDebitCardsModelCopyWith<$Res> {
  factory $ListDebitCardsModelCopyWith(
          ListDebitCardsModel value, $Res Function(ListDebitCardsModel) then) =
      _$ListDebitCardsModelCopyWithImpl<$Res, ListDebitCardsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'all_conditions_link') String allConditionsLink,
      @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
      @JsonKey(name: 'bank_name') String bankName,
      bool best,
      @JsonKey(name: 'cash_other_banks') bool cashOtherBanks,
      @JsonKey(name: 'cashback_format') String cashbackFormat,
      @JsonKey(name: 'citizenship_russia') bool citizenshipRussia,
      DebitCardsConditionsModel? conditions,
      String currencies,
      bool delivery,
      DebitCardsDescriptionsModel? descriptions,
      bool enable,
      List<String> features,
      @JsonKey(name: 'for_children') bool forChildren,
      @JsonKey(name: 'for_minors') bool forMinors,
      String image,
      @JsonKey(name: 'interest_on_balance') dynamic interestOnBalance,
      int issue,
      @JsonKey(name: 'max_age') int maxAge,
      @JsonKey(name: 'max_cashback') String maxCashBack,
      @JsonKey(name: 'max_cashback_percent') int maxCashbackPercent,
      @JsonKey(name: 'max_service') dynamic maxService,
      @JsonKey(name: 'max_sms') int maxSms,
      @JsonKey(name: 'min_age') int minAge,
      @JsonKey(name: 'min_service') dynamic minService,
      @JsonKey(name: 'min_sms') int minSms,
      String name,
      bool overdraft,
      @JsonKey(name: 'payment_system') String paymentSystem,
      bool popular,
      @JsonKey(name: 'ref_link') String refLink,
      @JsonKey(name: 'reg_russia') bool regRussia,
      int reissue,
      String slug});

  $BankListDetailsModelCopyWith<$Res>? get bankDetails;
  $DebitCardsConditionsModelCopyWith<$Res>? get conditions;
  $DebitCardsDescriptionsModelCopyWith<$Res>? get descriptions;
}

/// @nodoc
class _$ListDebitCardsModelCopyWithImpl<$Res, $Val extends ListDebitCardsModel>
    implements $ListDebitCardsModelCopyWith<$Res> {
  _$ListDebitCardsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? allConditionsLink = null,
    Object? bankDetails = freezed,
    Object? bankName = null,
    Object? best = null,
    Object? cashOtherBanks = null,
    Object? cashbackFormat = null,
    Object? citizenshipRussia = null,
    Object? conditions = freezed,
    Object? currencies = null,
    Object? delivery = null,
    Object? descriptions = freezed,
    Object? enable = null,
    Object? features = null,
    Object? forChildren = null,
    Object? forMinors = null,
    Object? image = null,
    Object? interestOnBalance = freezed,
    Object? issue = null,
    Object? maxAge = null,
    Object? maxCashBack = null,
    Object? maxCashbackPercent = null,
    Object? maxService = freezed,
    Object? maxSms = null,
    Object? minAge = null,
    Object? minService = freezed,
    Object? minSms = null,
    Object? name = null,
    Object? overdraft = null,
    Object? paymentSystem = null,
    Object? popular = null,
    Object? refLink = null,
    Object? regRussia = null,
    Object? reissue = null,
    Object? slug = null,
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
      bankDetails: freezed == bankDetails
          ? _value.bankDetails
          : bankDetails // ignore: cast_nullable_to_non_nullable
              as BankListDetailsModel?,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as bool,
      cashOtherBanks: null == cashOtherBanks
          ? _value.cashOtherBanks
          : cashOtherBanks // ignore: cast_nullable_to_non_nullable
              as bool,
      cashbackFormat: null == cashbackFormat
          ? _value.cashbackFormat
          : cashbackFormat // ignore: cast_nullable_to_non_nullable
              as String,
      citizenshipRussia: null == citizenshipRussia
          ? _value.citizenshipRussia
          : citizenshipRussia // ignore: cast_nullable_to_non_nullable
              as bool,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as DebitCardsConditionsModel?,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as String,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as bool,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as DebitCardsDescriptionsModel?,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      forChildren: null == forChildren
          ? _value.forChildren
          : forChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      forMinors: null == forMinors
          ? _value.forMinors
          : forMinors // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      interestOnBalance: freezed == interestOnBalance
          ? _value.interestOnBalance
          : interestOnBalance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxCashBack: null == maxCashBack
          ? _value.maxCashBack
          : maxCashBack // ignore: cast_nullable_to_non_nullable
              as String,
      maxCashbackPercent: null == maxCashbackPercent
          ? _value.maxCashbackPercent
          : maxCashbackPercent // ignore: cast_nullable_to_non_nullable
              as int,
      maxService: freezed == maxService
          ? _value.maxService
          : maxService // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxSms: null == maxSms
          ? _value.maxSms
          : maxSms // ignore: cast_nullable_to_non_nullable
              as int,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      minService: freezed == minService
          ? _value.minService
          : minService // ignore: cast_nullable_to_non_nullable
              as dynamic,
      minSms: null == minSms
          ? _value.minSms
          : minSms // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overdraft: null == overdraft
          ? _value.overdraft
          : overdraft // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentSystem: null == paymentSystem
          ? _value.paymentSystem
          : paymentSystem // ignore: cast_nullable_to_non_nullable
              as String,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      refLink: null == refLink
          ? _value.refLink
          : refLink // ignore: cast_nullable_to_non_nullable
              as String,
      regRussia: null == regRussia
          ? _value.regRussia
          : regRussia // ignore: cast_nullable_to_non_nullable
              as bool,
      reissue: null == reissue
          ? _value.reissue
          : reissue // ignore: cast_nullable_to_non_nullable
              as int,
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
  $DebitCardsConditionsModelCopyWith<$Res>? get conditions {
    if (_value.conditions == null) {
      return null;
    }

    return $DebitCardsConditionsModelCopyWith<$Res>(_value.conditions!,
        (value) {
      return _then(_value.copyWith(conditions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DebitCardsDescriptionsModelCopyWith<$Res>? get descriptions {
    if (_value.descriptions == null) {
      return null;
    }

    return $DebitCardsDescriptionsModelCopyWith<$Res>(_value.descriptions!,
        (value) {
      return _then(_value.copyWith(descriptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListDebitCardsModelImplCopyWith<$Res>
    implements $ListDebitCardsModelCopyWith<$Res> {
  factory _$$ListDebitCardsModelImplCopyWith(_$ListDebitCardsModelImpl value,
          $Res Function(_$ListDebitCardsModelImpl) then) =
      __$$ListDebitCardsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'all_conditions_link') String allConditionsLink,
      @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
      @JsonKey(name: 'bank_name') String bankName,
      bool best,
      @JsonKey(name: 'cash_other_banks') bool cashOtherBanks,
      @JsonKey(name: 'cashback_format') String cashbackFormat,
      @JsonKey(name: 'citizenship_russia') bool citizenshipRussia,
      DebitCardsConditionsModel? conditions,
      String currencies,
      bool delivery,
      DebitCardsDescriptionsModel? descriptions,
      bool enable,
      List<String> features,
      @JsonKey(name: 'for_children') bool forChildren,
      @JsonKey(name: 'for_minors') bool forMinors,
      String image,
      @JsonKey(name: 'interest_on_balance') dynamic interestOnBalance,
      int issue,
      @JsonKey(name: 'max_age') int maxAge,
      @JsonKey(name: 'max_cashback') String maxCashBack,
      @JsonKey(name: 'max_cashback_percent') int maxCashbackPercent,
      @JsonKey(name: 'max_service') dynamic maxService,
      @JsonKey(name: 'max_sms') int maxSms,
      @JsonKey(name: 'min_age') int minAge,
      @JsonKey(name: 'min_service') dynamic minService,
      @JsonKey(name: 'min_sms') int minSms,
      String name,
      bool overdraft,
      @JsonKey(name: 'payment_system') String paymentSystem,
      bool popular,
      @JsonKey(name: 'ref_link') String refLink,
      @JsonKey(name: 'reg_russia') bool regRussia,
      int reissue,
      String slug});

  @override
  $BankListDetailsModelCopyWith<$Res>? get bankDetails;
  @override
  $DebitCardsConditionsModelCopyWith<$Res>? get conditions;
  @override
  $DebitCardsDescriptionsModelCopyWith<$Res>? get descriptions;
}

/// @nodoc
class __$$ListDebitCardsModelImplCopyWithImpl<$Res>
    extends _$ListDebitCardsModelCopyWithImpl<$Res, _$ListDebitCardsModelImpl>
    implements _$$ListDebitCardsModelImplCopyWith<$Res> {
  __$$ListDebitCardsModelImplCopyWithImpl(_$ListDebitCardsModelImpl _value,
      $Res Function(_$ListDebitCardsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? allConditionsLink = null,
    Object? bankDetails = freezed,
    Object? bankName = null,
    Object? best = null,
    Object? cashOtherBanks = null,
    Object? cashbackFormat = null,
    Object? citizenshipRussia = null,
    Object? conditions = freezed,
    Object? currencies = null,
    Object? delivery = null,
    Object? descriptions = freezed,
    Object? enable = null,
    Object? features = null,
    Object? forChildren = null,
    Object? forMinors = null,
    Object? image = null,
    Object? interestOnBalance = freezed,
    Object? issue = null,
    Object? maxAge = null,
    Object? maxCashBack = null,
    Object? maxCashbackPercent = null,
    Object? maxService = freezed,
    Object? maxSms = null,
    Object? minAge = null,
    Object? minService = freezed,
    Object? minSms = null,
    Object? name = null,
    Object? overdraft = null,
    Object? paymentSystem = null,
    Object? popular = null,
    Object? refLink = null,
    Object? regRussia = null,
    Object? reissue = null,
    Object? slug = null,
  }) {
    return _then(_$ListDebitCardsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      allConditionsLink: null == allConditionsLink
          ? _value.allConditionsLink
          : allConditionsLink // ignore: cast_nullable_to_non_nullable
              as String,
      bankDetails: freezed == bankDetails
          ? _value.bankDetails
          : bankDetails // ignore: cast_nullable_to_non_nullable
              as BankListDetailsModel?,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as bool,
      cashOtherBanks: null == cashOtherBanks
          ? _value.cashOtherBanks
          : cashOtherBanks // ignore: cast_nullable_to_non_nullable
              as bool,
      cashbackFormat: null == cashbackFormat
          ? _value.cashbackFormat
          : cashbackFormat // ignore: cast_nullable_to_non_nullable
              as String,
      citizenshipRussia: null == citizenshipRussia
          ? _value.citizenshipRussia
          : citizenshipRussia // ignore: cast_nullable_to_non_nullable
              as bool,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as DebitCardsConditionsModel?,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as String,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as bool,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as DebitCardsDescriptionsModel?,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      forChildren: null == forChildren
          ? _value.forChildren
          : forChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      forMinors: null == forMinors
          ? _value.forMinors
          : forMinors // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      interestOnBalance: freezed == interestOnBalance
          ? _value.interestOnBalance
          : interestOnBalance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxCashBack: null == maxCashBack
          ? _value.maxCashBack
          : maxCashBack // ignore: cast_nullable_to_non_nullable
              as String,
      maxCashbackPercent: null == maxCashbackPercent
          ? _value.maxCashbackPercent
          : maxCashbackPercent // ignore: cast_nullable_to_non_nullable
              as int,
      maxService: freezed == maxService
          ? _value.maxService
          : maxService // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxSms: null == maxSms
          ? _value.maxSms
          : maxSms // ignore: cast_nullable_to_non_nullable
              as int,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      minService: freezed == minService
          ? _value.minService
          : minService // ignore: cast_nullable_to_non_nullable
              as dynamic,
      minSms: null == minSms
          ? _value.minSms
          : minSms // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overdraft: null == overdraft
          ? _value.overdraft
          : overdraft // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentSystem: null == paymentSystem
          ? _value.paymentSystem
          : paymentSystem // ignore: cast_nullable_to_non_nullable
              as String,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      refLink: null == refLink
          ? _value.refLink
          : refLink // ignore: cast_nullable_to_non_nullable
              as String,
      regRussia: null == regRussia
          ? _value.regRussia
          : regRussia // ignore: cast_nullable_to_non_nullable
              as bool,
      reissue: null == reissue
          ? _value.reissue
          : reissue // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListDebitCardsModelImpl implements _ListDebitCardsModel {
  _$ListDebitCardsModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'all_conditions_link') this.allConditionsLink = '',
      @JsonKey(name: 'bank_details') this.bankDetails,
      @JsonKey(name: 'bank_name') this.bankName = '',
      this.best = false,
      @JsonKey(name: 'cash_other_banks') this.cashOtherBanks = false,
      @JsonKey(name: 'cashback_format') this.cashbackFormat = '',
      @JsonKey(name: 'citizenship_russia') this.citizenshipRussia = false,
      this.conditions,
      this.currencies = '',
      this.delivery = false,
      this.descriptions,
      this.enable = false,
      final List<String> features = const [],
      @JsonKey(name: 'for_children') this.forChildren = false,
      @JsonKey(name: 'for_minors') this.forMinors = false,
      this.image = '',
      @JsonKey(name: 'interest_on_balance') this.interestOnBalance = '',
      this.issue = 0,
      @JsonKey(name: 'max_age') this.maxAge = 0,
      @JsonKey(name: 'max_cashback') this.maxCashBack = '',
      @JsonKey(name: 'max_cashback_percent') this.maxCashbackPercent = 0,
      @JsonKey(name: 'max_service') this.maxService = 0,
      @JsonKey(name: 'max_sms') this.maxSms = 0,
      @JsonKey(name: 'min_age') this.minAge = 0,
      @JsonKey(name: 'min_service') this.minService = 0,
      @JsonKey(name: 'min_sms') this.minSms = 0,
      this.name = '',
      this.overdraft = false,
      @JsonKey(name: 'payment_system') this.paymentSystem = '',
      this.popular = false,
      @JsonKey(name: 'ref_link') this.refLink = '',
      @JsonKey(name: 'reg_russia') this.regRussia = false,
      this.reissue = 0,
      this.slug = ''})
      : _features = features;

  factory _$ListDebitCardsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListDebitCardsModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'all_conditions_link')
  final String allConditionsLink;
  @override
  @JsonKey(name: 'bank_details')
  final BankListDetailsModel? bankDetails;
  @override
  @JsonKey(name: 'bank_name')
  final String bankName;
  @override
  @JsonKey()
  final bool best;
  @override
  @JsonKey(name: 'cash_other_banks')
  final bool cashOtherBanks;
  @override
  @JsonKey(name: 'cashback_format')
  final String cashbackFormat;
  @override
  @JsonKey(name: 'citizenship_russia')
  final bool citizenshipRussia;
  @override
  final DebitCardsConditionsModel? conditions;
  @override
  @JsonKey()
  final String currencies;
  @override
  @JsonKey()
  final bool delivery;
  @override
  final DebitCardsDescriptionsModel? descriptions;
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
  @JsonKey(name: 'for_children')
  final bool forChildren;
  @override
  @JsonKey(name: 'for_minors')
  final bool forMinors;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey(name: 'interest_on_balance')
  final dynamic interestOnBalance;
  @override
  @JsonKey()
  final int issue;
  @override
  @JsonKey(name: 'max_age')
  final int maxAge;
  @override
  @JsonKey(name: 'max_cashback')
  final String maxCashBack;
  @override
  @JsonKey(name: 'max_cashback_percent')
  final int maxCashbackPercent;
  @override
  @JsonKey(name: 'max_service')
  final dynamic maxService;
  @override
  @JsonKey(name: 'max_sms')
  final int maxSms;
  @override
  @JsonKey(name: 'min_age')
  final int minAge;
  @override
  @JsonKey(name: 'min_service')
  final dynamic minService;
  @override
  @JsonKey(name: 'min_sms')
  final int minSms;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool overdraft;
  @override
  @JsonKey(name: 'payment_system')
  final String paymentSystem;
  @override
  @JsonKey()
  final bool popular;
  @override
  @JsonKey(name: 'ref_link')
  final String refLink;
  @override
  @JsonKey(name: 'reg_russia')
  final bool regRussia;
  @override
  @JsonKey()
  final int reissue;
  @override
  @JsonKey()
  final String slug;

  @override
  String toString() {
    return 'ListDebitCardsModel(id: $id, allConditionsLink: $allConditionsLink, bankDetails: $bankDetails, bankName: $bankName, best: $best, cashOtherBanks: $cashOtherBanks, cashbackFormat: $cashbackFormat, citizenshipRussia: $citizenshipRussia, conditions: $conditions, currencies: $currencies, delivery: $delivery, descriptions: $descriptions, enable: $enable, features: $features, forChildren: $forChildren, forMinors: $forMinors, image: $image, interestOnBalance: $interestOnBalance, issue: $issue, maxAge: $maxAge, maxCashBack: $maxCashBack, maxCashbackPercent: $maxCashbackPercent, maxService: $maxService, maxSms: $maxSms, minAge: $minAge, minService: $minService, minSms: $minSms, name: $name, overdraft: $overdraft, paymentSystem: $paymentSystem, popular: $popular, refLink: $refLink, regRussia: $regRussia, reissue: $reissue, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListDebitCardsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.allConditionsLink, allConditionsLink) ||
                other.allConditionsLink == allConditionsLink) &&
            (identical(other.bankDetails, bankDetails) ||
                other.bankDetails == bankDetails) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.best, best) || other.best == best) &&
            (identical(other.cashOtherBanks, cashOtherBanks) ||
                other.cashOtherBanks == cashOtherBanks) &&
            (identical(other.cashbackFormat, cashbackFormat) ||
                other.cashbackFormat == cashbackFormat) &&
            (identical(other.citizenshipRussia, citizenshipRussia) ||
                other.citizenshipRussia == citizenshipRussia) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.currencies, currencies) ||
                other.currencies == currencies) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.forChildren, forChildren) ||
                other.forChildren == forChildren) &&
            (identical(other.forMinors, forMinors) ||
                other.forMinors == forMinors) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other.interestOnBalance, interestOnBalance) &&
            (identical(other.issue, issue) || other.issue == issue) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.maxCashBack, maxCashBack) ||
                other.maxCashBack == maxCashBack) &&
            (identical(other.maxCashbackPercent, maxCashbackPercent) ||
                other.maxCashbackPercent == maxCashbackPercent) &&
            const DeepCollectionEquality()
                .equals(other.maxService, maxService) &&
            (identical(other.maxSms, maxSms) || other.maxSms == maxSms) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            const DeepCollectionEquality()
                .equals(other.minService, minService) &&
            (identical(other.minSms, minSms) || other.minSms == minSms) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overdraft, overdraft) ||
                other.overdraft == overdraft) &&
            (identical(other.paymentSystem, paymentSystem) ||
                other.paymentSystem == paymentSystem) &&
            (identical(other.popular, popular) || other.popular == popular) &&
            (identical(other.refLink, refLink) || other.refLink == refLink) &&
            (identical(other.regRussia, regRussia) ||
                other.regRussia == regRussia) &&
            (identical(other.reissue, reissue) || other.reissue == reissue) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        allConditionsLink,
        bankDetails,
        bankName,
        best,
        cashOtherBanks,
        cashbackFormat,
        citizenshipRussia,
        conditions,
        currencies,
        delivery,
        descriptions,
        enable,
        const DeepCollectionEquality().hash(_features),
        forChildren,
        forMinors,
        image,
        const DeepCollectionEquality().hash(interestOnBalance),
        issue,
        maxAge,
        maxCashBack,
        maxCashbackPercent,
        const DeepCollectionEquality().hash(maxService),
        maxSms,
        minAge,
        const DeepCollectionEquality().hash(minService),
        minSms,
        name,
        overdraft,
        paymentSystem,
        popular,
        refLink,
        regRussia,
        reissue,
        slug
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListDebitCardsModelImplCopyWith<_$ListDebitCardsModelImpl> get copyWith =>
      __$$ListDebitCardsModelImplCopyWithImpl<_$ListDebitCardsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListDebitCardsModelImplToJson(
      this,
    );
  }
}

abstract class _ListDebitCardsModel implements ListDebitCardsModel {
  factory _ListDebitCardsModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'all_conditions_link') final String allConditionsLink,
      @JsonKey(name: 'bank_details') final BankListDetailsModel? bankDetails,
      @JsonKey(name: 'bank_name') final String bankName,
      final bool best,
      @JsonKey(name: 'cash_other_banks') final bool cashOtherBanks,
      @JsonKey(name: 'cashback_format') final String cashbackFormat,
      @JsonKey(name: 'citizenship_russia') final bool citizenshipRussia,
      final DebitCardsConditionsModel? conditions,
      final String currencies,
      final bool delivery,
      final DebitCardsDescriptionsModel? descriptions,
      final bool enable,
      final List<String> features,
      @JsonKey(name: 'for_children') final bool forChildren,
      @JsonKey(name: 'for_minors') final bool forMinors,
      final String image,
      @JsonKey(name: 'interest_on_balance') final dynamic interestOnBalance,
      final int issue,
      @JsonKey(name: 'max_age') final int maxAge,
      @JsonKey(name: 'max_cashback') final String maxCashBack,
      @JsonKey(name: 'max_cashback_percent') final int maxCashbackPercent,
      @JsonKey(name: 'max_service') final dynamic maxService,
      @JsonKey(name: 'max_sms') final int maxSms,
      @JsonKey(name: 'min_age') final int minAge,
      @JsonKey(name: 'min_service') final dynamic minService,
      @JsonKey(name: 'min_sms') final int minSms,
      final String name,
      final bool overdraft,
      @JsonKey(name: 'payment_system') final String paymentSystem,
      final bool popular,
      @JsonKey(name: 'ref_link') final String refLink,
      @JsonKey(name: 'reg_russia') final bool regRussia,
      final int reissue,
      final String slug}) = _$ListDebitCardsModelImpl;

  factory _ListDebitCardsModel.fromJson(Map<String, dynamic> json) =
      _$ListDebitCardsModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'all_conditions_link')
  String get allConditionsLink;
  @override
  @JsonKey(name: 'bank_details')
  BankListDetailsModel? get bankDetails;
  @override
  @JsonKey(name: 'bank_name')
  String get bankName;
  @override
  bool get best;
  @override
  @JsonKey(name: 'cash_other_banks')
  bool get cashOtherBanks;
  @override
  @JsonKey(name: 'cashback_format')
  String get cashbackFormat;
  @override
  @JsonKey(name: 'citizenship_russia')
  bool get citizenshipRussia;
  @override
  DebitCardsConditionsModel? get conditions;
  @override
  String get currencies;
  @override
  bool get delivery;
  @override
  DebitCardsDescriptionsModel? get descriptions;
  @override
  bool get enable;
  @override
  List<String> get features;
  @override
  @JsonKey(name: 'for_children')
  bool get forChildren;
  @override
  @JsonKey(name: 'for_minors')
  bool get forMinors;
  @override
  String get image;
  @override
  @JsonKey(name: 'interest_on_balance')
  dynamic get interestOnBalance;
  @override
  int get issue;
  @override
  @JsonKey(name: 'max_age')
  int get maxAge;
  @override
  @JsonKey(name: 'max_cashback')
  String get maxCashBack;
  @override
  @JsonKey(name: 'max_cashback_percent')
  int get maxCashbackPercent;
  @override
  @JsonKey(name: 'max_service')
  dynamic get maxService;
  @override
  @JsonKey(name: 'max_sms')
  int get maxSms;
  @override
  @JsonKey(name: 'min_age')
  int get minAge;
  @override
  @JsonKey(name: 'min_service')
  dynamic get minService;
  @override
  @JsonKey(name: 'min_sms')
  int get minSms;
  @override
  String get name;
  @override
  bool get overdraft;
  @override
  @JsonKey(name: 'payment_system')
  String get paymentSystem;
  @override
  bool get popular;
  @override
  @JsonKey(name: 'ref_link')
  String get refLink;
  @override
  @JsonKey(name: 'reg_russia')
  bool get regRussia;
  @override
  int get reissue;
  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$ListDebitCardsModelImplCopyWith<_$ListDebitCardsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DebitCardsConditionsModel _$DebitCardsConditionsModelFromJson(
    Map<String, dynamic> json) {
  return _DebitCardsConditionsModel.fromJson(json);
}

/// @nodoc
mixin _$DebitCardsConditionsModel {
  @JsonKey(name: 'accrual_of_bonuses')
  String get accrualOfBonuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal => throw _privateConstructorUsedError;
  String get stocks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DebitCardsConditionsModelCopyWith<DebitCardsConditionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebitCardsConditionsModelCopyWith<$Res> {
  factory $DebitCardsConditionsModelCopyWith(DebitCardsConditionsModel value,
          $Res Function(DebitCardsConditionsModel) then) =
      _$DebitCardsConditionsModelCopyWithImpl<$Res, DebitCardsConditionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'accrual_of_bonuses') String accrualOfBonuses,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      String stocks});
}

/// @nodoc
class _$DebitCardsConditionsModelCopyWithImpl<$Res,
        $Val extends DebitCardsConditionsModel>
    implements $DebitCardsConditionsModelCopyWith<$Res> {
  _$DebitCardsConditionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accrualOfBonuses = null,
    Object? cashWithdrawal = null,
    Object? stocks = null,
  }) {
    return _then(_value.copyWith(
      accrualOfBonuses: null == accrualOfBonuses
          ? _value.accrualOfBonuses
          : accrualOfBonuses // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebitCardsConditionsModelImplCopyWith<$Res>
    implements $DebitCardsConditionsModelCopyWith<$Res> {
  factory _$$DebitCardsConditionsModelImplCopyWith(
          _$DebitCardsConditionsModelImpl value,
          $Res Function(_$DebitCardsConditionsModelImpl) then) =
      __$$DebitCardsConditionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'accrual_of_bonuses') String accrualOfBonuses,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      String stocks});
}

/// @nodoc
class __$$DebitCardsConditionsModelImplCopyWithImpl<$Res>
    extends _$DebitCardsConditionsModelCopyWithImpl<$Res,
        _$DebitCardsConditionsModelImpl>
    implements _$$DebitCardsConditionsModelImplCopyWith<$Res> {
  __$$DebitCardsConditionsModelImplCopyWithImpl(
      _$DebitCardsConditionsModelImpl _value,
      $Res Function(_$DebitCardsConditionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accrualOfBonuses = null,
    Object? cashWithdrawal = null,
    Object? stocks = null,
  }) {
    return _then(_$DebitCardsConditionsModelImpl(
      accrualOfBonuses: null == accrualOfBonuses
          ? _value.accrualOfBonuses
          : accrualOfBonuses // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebitCardsConditionsModelImpl implements _DebitCardsConditionsModel {
  _$DebitCardsConditionsModelImpl(
      {@JsonKey(name: 'accrual_of_bonuses') this.accrualOfBonuses = '',
      @JsonKey(name: 'cash_withdrawal') this.cashWithdrawal = '',
      this.stocks = ''});

  factory _$DebitCardsConditionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DebitCardsConditionsModelImplFromJson(json);

  @override
  @JsonKey(name: 'accrual_of_bonuses')
  final String accrualOfBonuses;
  @override
  @JsonKey(name: 'cash_withdrawal')
  final String cashWithdrawal;
  @override
  @JsonKey()
  final String stocks;

  @override
  String toString() {
    return 'DebitCardsConditionsModel(accrualOfBonuses: $accrualOfBonuses, cashWithdrawal: $cashWithdrawal, stocks: $stocks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebitCardsConditionsModelImpl &&
            (identical(other.accrualOfBonuses, accrualOfBonuses) ||
                other.accrualOfBonuses == accrualOfBonuses) &&
            (identical(other.cashWithdrawal, cashWithdrawal) ||
                other.cashWithdrawal == cashWithdrawal) &&
            (identical(other.stocks, stocks) || other.stocks == stocks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accrualOfBonuses, cashWithdrawal, stocks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DebitCardsConditionsModelImplCopyWith<_$DebitCardsConditionsModelImpl>
      get copyWith => __$$DebitCardsConditionsModelImplCopyWithImpl<
          _$DebitCardsConditionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebitCardsConditionsModelImplToJson(
      this,
    );
  }
}

abstract class _DebitCardsConditionsModel implements DebitCardsConditionsModel {
  factory _DebitCardsConditionsModel(
      {@JsonKey(name: 'accrual_of_bonuses') final String accrualOfBonuses,
      @JsonKey(name: 'cash_withdrawal') final String cashWithdrawal,
      final String stocks}) = _$DebitCardsConditionsModelImpl;

  factory _DebitCardsConditionsModel.fromJson(Map<String, dynamic> json) =
      _$DebitCardsConditionsModelImpl.fromJson;

  @override
  @JsonKey(name: 'accrual_of_bonuses')
  String get accrualOfBonuses;
  @override
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal;
  @override
  String get stocks;
  @override
  @JsonKey(ignore: true)
  _$$DebitCardsConditionsModelImplCopyWith<_$DebitCardsConditionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DebitCardsDescriptionsModel _$DebitCardsDescriptionsModelFromJson(
    Map<String, dynamic> json) {
  return _DebitCardsDescriptionsModel.fromJson(json);
}

/// @nodoc
mixin _$DebitCardsDescriptionsModel {
  @JsonKey(name: 'bonus_program')
  String get bonusProgram => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal => throw _privateConstructorUsedError;
  @JsonKey(name: 'connectable_options')
  String get connectableOptions => throw _privateConstructorUsedError;
  String get execution => throw _privateConstructorUsedError;
  @JsonKey(name: 'interest_calculation')
  String get interestCalculation => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  String get stocks => throw _privateConstructorUsedError;
  String get support => throw _privateConstructorUsedError;
  String get transfers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DebitCardsDescriptionsModelCopyWith<DebitCardsDescriptionsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebitCardsDescriptionsModelCopyWith<$Res> {
  factory $DebitCardsDescriptionsModelCopyWith(
          DebitCardsDescriptionsModel value,
          $Res Function(DebitCardsDescriptionsModel) then) =
      _$DebitCardsDescriptionsModelCopyWithImpl<$Res,
          DebitCardsDescriptionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bonus_program') String bonusProgram,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      @JsonKey(name: 'connectable_options') String connectableOptions,
      String execution,
      @JsonKey(name: 'interest_calculation') String interestCalculation,
      String result,
      String service,
      String stocks,
      String support,
      String transfers});
}

/// @nodoc
class _$DebitCardsDescriptionsModelCopyWithImpl<$Res,
        $Val extends DebitCardsDescriptionsModel>
    implements $DebitCardsDescriptionsModelCopyWith<$Res> {
  _$DebitCardsDescriptionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonusProgram = null,
    Object? cashWithdrawal = null,
    Object? connectableOptions = null,
    Object? execution = null,
    Object? interestCalculation = null,
    Object? result = null,
    Object? service = null,
    Object? stocks = null,
    Object? support = null,
    Object? transfers = null,
  }) {
    return _then(_value.copyWith(
      bonusProgram: null == bonusProgram
          ? _value.bonusProgram
          : bonusProgram // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      connectableOptions: null == connectableOptions
          ? _value.connectableOptions
          : connectableOptions // ignore: cast_nullable_to_non_nullable
              as String,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as String,
      interestCalculation: null == interestCalculation
          ? _value.interestCalculation
          : interestCalculation // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as String,
      support: null == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as String,
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebitCardsDescriptionsModelImplCopyWith<$Res>
    implements $DebitCardsDescriptionsModelCopyWith<$Res> {
  factory _$$DebitCardsDescriptionsModelImplCopyWith(
          _$DebitCardsDescriptionsModelImpl value,
          $Res Function(_$DebitCardsDescriptionsModelImpl) then) =
      __$$DebitCardsDescriptionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bonus_program') String bonusProgram,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      @JsonKey(name: 'connectable_options') String connectableOptions,
      String execution,
      @JsonKey(name: 'interest_calculation') String interestCalculation,
      String result,
      String service,
      String stocks,
      String support,
      String transfers});
}

/// @nodoc
class __$$DebitCardsDescriptionsModelImplCopyWithImpl<$Res>
    extends _$DebitCardsDescriptionsModelCopyWithImpl<$Res,
        _$DebitCardsDescriptionsModelImpl>
    implements _$$DebitCardsDescriptionsModelImplCopyWith<$Res> {
  __$$DebitCardsDescriptionsModelImplCopyWithImpl(
      _$DebitCardsDescriptionsModelImpl _value,
      $Res Function(_$DebitCardsDescriptionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonusProgram = null,
    Object? cashWithdrawal = null,
    Object? connectableOptions = null,
    Object? execution = null,
    Object? interestCalculation = null,
    Object? result = null,
    Object? service = null,
    Object? stocks = null,
    Object? support = null,
    Object? transfers = null,
  }) {
    return _then(_$DebitCardsDescriptionsModelImpl(
      bonusProgram: null == bonusProgram
          ? _value.bonusProgram
          : bonusProgram // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      connectableOptions: null == connectableOptions
          ? _value.connectableOptions
          : connectableOptions // ignore: cast_nullable_to_non_nullable
              as String,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as String,
      interestCalculation: null == interestCalculation
          ? _value.interestCalculation
          : interestCalculation // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as String,
      support: null == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as String,
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebitCardsDescriptionsModelImpl
    implements _DebitCardsDescriptionsModel {
  _$DebitCardsDescriptionsModelImpl(
      {@JsonKey(name: 'bonus_program') this.bonusProgram = '',
      @JsonKey(name: 'cash_withdrawal') this.cashWithdrawal = '',
      @JsonKey(name: 'connectable_options') this.connectableOptions = '',
      this.execution = '',
      @JsonKey(name: 'interest_calculation') this.interestCalculation = '',
      this.result = '',
      this.service = '',
      this.stocks = '',
      this.support = '',
      this.transfers = ''});

  factory _$DebitCardsDescriptionsModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DebitCardsDescriptionsModelImplFromJson(json);

  @override
  @JsonKey(name: 'bonus_program')
  final String bonusProgram;
  @override
  @JsonKey(name: 'cash_withdrawal')
  final String cashWithdrawal;
  @override
  @JsonKey(name: 'connectable_options')
  final String connectableOptions;
  @override
  @JsonKey()
  final String execution;
  @override
  @JsonKey(name: 'interest_calculation')
  final String interestCalculation;
  @override
  @JsonKey()
  final String result;
  @override
  @JsonKey()
  final String service;
  @override
  @JsonKey()
  final String stocks;
  @override
  @JsonKey()
  final String support;
  @override
  @JsonKey()
  final String transfers;

  @override
  String toString() {
    return 'DebitCardsDescriptionsModel(bonusProgram: $bonusProgram, cashWithdrawal: $cashWithdrawal, connectableOptions: $connectableOptions, execution: $execution, interestCalculation: $interestCalculation, result: $result, service: $service, stocks: $stocks, support: $support, transfers: $transfers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebitCardsDescriptionsModelImpl &&
            (identical(other.bonusProgram, bonusProgram) ||
                other.bonusProgram == bonusProgram) &&
            (identical(other.cashWithdrawal, cashWithdrawal) ||
                other.cashWithdrawal == cashWithdrawal) &&
            (identical(other.connectableOptions, connectableOptions) ||
                other.connectableOptions == connectableOptions) &&
            (identical(other.execution, execution) ||
                other.execution == execution) &&
            (identical(other.interestCalculation, interestCalculation) ||
                other.interestCalculation == interestCalculation) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.stocks, stocks) || other.stocks == stocks) &&
            (identical(other.support, support) || other.support == support) &&
            (identical(other.transfers, transfers) ||
                other.transfers == transfers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bonusProgram,
      cashWithdrawal,
      connectableOptions,
      execution,
      interestCalculation,
      result,
      service,
      stocks,
      support,
      transfers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DebitCardsDescriptionsModelImplCopyWith<_$DebitCardsDescriptionsModelImpl>
      get copyWith => __$$DebitCardsDescriptionsModelImplCopyWithImpl<
          _$DebitCardsDescriptionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebitCardsDescriptionsModelImplToJson(
      this,
    );
  }
}

abstract class _DebitCardsDescriptionsModel
    implements DebitCardsDescriptionsModel {
  factory _DebitCardsDescriptionsModel(
      {@JsonKey(name: 'bonus_program') final String bonusProgram,
      @JsonKey(name: 'cash_withdrawal') final String cashWithdrawal,
      @JsonKey(name: 'connectable_options') final String connectableOptions,
      final String execution,
      @JsonKey(name: 'interest_calculation') final String interestCalculation,
      final String result,
      final String service,
      final String stocks,
      final String support,
      final String transfers}) = _$DebitCardsDescriptionsModelImpl;

  factory _DebitCardsDescriptionsModel.fromJson(Map<String, dynamic> json) =
      _$DebitCardsDescriptionsModelImpl.fromJson;

  @override
  @JsonKey(name: 'bonus_program')
  String get bonusProgram;
  @override
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal;
  @override
  @JsonKey(name: 'connectable_options')
  String get connectableOptions;
  @override
  String get execution;
  @override
  @JsonKey(name: 'interest_calculation')
  String get interestCalculation;
  @override
  String get result;
  @override
  String get service;
  @override
  String get stocks;
  @override
  String get support;
  @override
  String get transfers;
  @override
  @JsonKey(ignore: true)
  _$$DebitCardsDescriptionsModelImplCopyWith<_$DebitCardsDescriptionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
