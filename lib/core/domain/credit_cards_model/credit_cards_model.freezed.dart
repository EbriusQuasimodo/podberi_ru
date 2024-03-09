// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_cards_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreditCardsModel _$CreditCardsModelFromJson(Map<String, dynamic> json) {
  return _CreditCardsModel.fromJson(json);
}

/// @nodoc
mixin _$CreditCardsModel {
  @JsonKey(name: 'items')
  List<ListCreditCardsModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCardsModelCopyWith<CreditCardsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardsModelCopyWith<$Res> {
  factory $CreditCardsModelCopyWith(
          CreditCardsModel value, $Res Function(CreditCardsModel) then) =
      _$CreditCardsModelCopyWithImpl<$Res, CreditCardsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListCreditCardsModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class _$CreditCardsModelCopyWithImpl<$Res, $Val extends CreditCardsModel>
    implements $CreditCardsModelCopyWith<$Res> {
  _$CreditCardsModelCopyWithImpl(this._value, this._then);

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
              as List<ListCreditCardsModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditCardsModelImplCopyWith<$Res>
    implements $CreditCardsModelCopyWith<$Res> {
  factory _$$CreditCardsModelImplCopyWith(_$CreditCardsModelImpl value,
          $Res Function(_$CreditCardsModelImpl) then) =
      __$$CreditCardsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ListCreditCardsModel> items,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class __$$CreditCardsModelImplCopyWithImpl<$Res>
    extends _$CreditCardsModelCopyWithImpl<$Res, _$CreditCardsModelImpl>
    implements _$$CreditCardsModelImplCopyWith<$Res> {
  __$$CreditCardsModelImplCopyWithImpl(_$CreditCardsModelImpl _value,
      $Res Function(_$CreditCardsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? itemsCount = null,
  }) {
    return _then(_$CreditCardsModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListCreditCardsModel>,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditCardsModelImpl implements _CreditCardsModel {
  _$CreditCardsModelImpl(
      {@JsonKey(name: 'items')
      final List<ListCreditCardsModel> items = const [],
      @JsonKey(name: 'items_count') this.itemsCount = 0})
      : _items = items;

  factory _$CreditCardsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditCardsModelImplFromJson(json);

  final List<ListCreditCardsModel> _items;
  @override
  @JsonKey(name: 'items')
  List<ListCreditCardsModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;

  @override
  String toString() {
    return 'CreditCardsModel(items: $items, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardsModelImpl &&
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
  _$$CreditCardsModelImplCopyWith<_$CreditCardsModelImpl> get copyWith =>
      __$$CreditCardsModelImplCopyWithImpl<_$CreditCardsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditCardsModelImplToJson(
      this,
    );
  }
}

abstract class _CreditCardsModel implements CreditCardsModel {
  factory _CreditCardsModel(
          {@JsonKey(name: 'items') final List<ListCreditCardsModel> items,
          @JsonKey(name: 'items_count') final int itemsCount}) =
      _$CreditCardsModelImpl;

  factory _CreditCardsModel.fromJson(Map<String, dynamic> json) =
      _$CreditCardsModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ListCreditCardsModel> get items;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;
  @override
  @JsonKey(ignore: true)
  _$$CreditCardsModelImplCopyWith<_$CreditCardsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListCreditCardsModel _$ListCreditCardsModelFromJson(Map<String, dynamic> json) {
  return _ListCreditCardsModel.fromJson(json);
}

/// @nodoc
mixin _$ListCreditCardsModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'all_conditions_link')
  String get allConditionsLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_details')
  BankListDetailsModel? get bankDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String get bankName => throw _privateConstructorUsedError;
  bool get best => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashback_format')
  String get cashbackFormat => throw _privateConstructorUsedError;
  @JsonKey(name: 'citizenship_russia')
  bool get citizenshipRussia => throw _privateConstructorUsedError;
  CreditCardsConditionsModel? get conditions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_limit')
  int get creditLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_rates')
  List<String> get creditRates => throw _privateConstructorUsedError;
  bool get delivery => throw _privateConstructorUsedError;
  CreditCardsDescriptionsModel? get descriptions =>
      throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  dynamic get issue => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_age')
  dynamic get maxAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_cashback')
  String get maxCashBack => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_cashback_percent')
  int get maxCashbackPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_percent')
  double get maxPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_service')
  int get maxService => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_sms')
  dynamic get maxSms => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_age')
  int get minAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_income')
  int get minIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_percent')
  double get minPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_service')
  int get minService => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_sms')
  int get minSms => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_percent_period')
  int get noPercentPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_system')
  String get paymentSystem => throw _privateConstructorUsedError;
  bool get popular => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref_link')
  String get refLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'reg_russia')
  bool get regRussia => throw _privateConstructorUsedError;
  int get reissue => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'with_refinancing')
  bool get withRefinancing => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_exp')
  String get workExp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListCreditCardsModelCopyWith<ListCreditCardsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCreditCardsModelCopyWith<$Res> {
  factory $ListCreditCardsModelCopyWith(ListCreditCardsModel value,
          $Res Function(ListCreditCardsModel) then) =
      _$ListCreditCardsModelCopyWithImpl<$Res, ListCreditCardsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'all_conditions_link') String allConditionsLink,
      @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
      @JsonKey(name: 'bank_name') String bankName,
      bool best,
      @JsonKey(name: 'cashback_format') String cashbackFormat,
      @JsonKey(name: 'citizenship_russia') bool citizenshipRussia,
      CreditCardsConditionsModel? conditions,
      @JsonKey(name: 'credit_limit') int creditLimit,
      @JsonKey(name: 'credit_rates') List<String> creditRates,
      bool delivery,
      CreditCardsDescriptionsModel? descriptions,
      bool enable,
      List<String> features,
      String image,
      dynamic issue,
      @JsonKey(name: 'max_age') dynamic maxAge,
      @JsonKey(name: 'max_cashback') String maxCashBack,
      @JsonKey(name: 'max_cashback_percent') int maxCashbackPercent,
      @JsonKey(name: 'max_percent') double maxPercent,
      @JsonKey(name: 'max_service') int maxService,
      @JsonKey(name: 'max_sms') dynamic maxSms,
      @JsonKey(name: 'min_age') int minAge,
      @JsonKey(name: 'min_income') int minIncome,
      @JsonKey(name: 'min_percent') double minPercent,
      @JsonKey(name: 'min_service') int minService,
      @JsonKey(name: 'min_sms') int minSms,
      String name,
      @JsonKey(name: 'no_percent_period') int noPercentPeriod,
      @JsonKey(name: 'payment_system') String paymentSystem,
      bool popular,
      @JsonKey(name: 'ref_link') String refLink,
      @JsonKey(name: 'reg_russia') bool regRussia,
      int reissue,
      String slug,
      @JsonKey(name: 'with_refinancing') bool withRefinancing,
      @JsonKey(name: 'work_exp') String workExp});

  $BankListDetailsModelCopyWith<$Res>? get bankDetails;
  $CreditCardsConditionsModelCopyWith<$Res>? get conditions;
  $CreditCardsDescriptionsModelCopyWith<$Res>? get descriptions;
}

/// @nodoc
class _$ListCreditCardsModelCopyWithImpl<$Res,
        $Val extends ListCreditCardsModel>
    implements $ListCreditCardsModelCopyWith<$Res> {
  _$ListCreditCardsModelCopyWithImpl(this._value, this._then);

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
    Object? cashbackFormat = null,
    Object? citizenshipRussia = null,
    Object? conditions = freezed,
    Object? creditLimit = null,
    Object? creditRates = null,
    Object? delivery = null,
    Object? descriptions = freezed,
    Object? enable = null,
    Object? features = null,
    Object? image = null,
    Object? issue = freezed,
    Object? maxAge = freezed,
    Object? maxCashBack = null,
    Object? maxCashbackPercent = null,
    Object? maxPercent = null,
    Object? maxService = null,
    Object? maxSms = freezed,
    Object? minAge = null,
    Object? minIncome = null,
    Object? minPercent = null,
    Object? minService = null,
    Object? minSms = null,
    Object? name = null,
    Object? noPercentPeriod = null,
    Object? paymentSystem = null,
    Object? popular = null,
    Object? refLink = null,
    Object? regRussia = null,
    Object? reissue = null,
    Object? slug = null,
    Object? withRefinancing = null,
    Object? workExp = null,
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
              as CreditCardsConditionsModel?,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as int,
      creditRates: null == creditRates
          ? _value.creditRates
          : creditRates // ignore: cast_nullable_to_non_nullable
              as List<String>,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as bool,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as CreditCardsDescriptionsModel?,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      issue: freezed == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxAge: freezed == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxCashBack: null == maxCashBack
          ? _value.maxCashBack
          : maxCashBack // ignore: cast_nullable_to_non_nullable
              as String,
      maxCashbackPercent: null == maxCashbackPercent
          ? _value.maxCashbackPercent
          : maxCashbackPercent // ignore: cast_nullable_to_non_nullable
              as int,
      maxPercent: null == maxPercent
          ? _value.maxPercent
          : maxPercent // ignore: cast_nullable_to_non_nullable
              as double,
      maxService: null == maxService
          ? _value.maxService
          : maxService // ignore: cast_nullable_to_non_nullable
              as int,
      maxSms: freezed == maxSms
          ? _value.maxSms
          : maxSms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      minIncome: null == minIncome
          ? _value.minIncome
          : minIncome // ignore: cast_nullable_to_non_nullable
              as int,
      minPercent: null == minPercent
          ? _value.minPercent
          : minPercent // ignore: cast_nullable_to_non_nullable
              as double,
      minService: null == minService
          ? _value.minService
          : minService // ignore: cast_nullable_to_non_nullable
              as int,
      minSms: null == minSms
          ? _value.minSms
          : minSms // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      noPercentPeriod: null == noPercentPeriod
          ? _value.noPercentPeriod
          : noPercentPeriod // ignore: cast_nullable_to_non_nullable
              as int,
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
      withRefinancing: null == withRefinancing
          ? _value.withRefinancing
          : withRefinancing // ignore: cast_nullable_to_non_nullable
              as bool,
      workExp: null == workExp
          ? _value.workExp
          : workExp // ignore: cast_nullable_to_non_nullable
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
  $CreditCardsConditionsModelCopyWith<$Res>? get conditions {
    if (_value.conditions == null) {
      return null;
    }

    return $CreditCardsConditionsModelCopyWith<$Res>(_value.conditions!,
        (value) {
      return _then(_value.copyWith(conditions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditCardsDescriptionsModelCopyWith<$Res>? get descriptions {
    if (_value.descriptions == null) {
      return null;
    }

    return $CreditCardsDescriptionsModelCopyWith<$Res>(_value.descriptions!,
        (value) {
      return _then(_value.copyWith(descriptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListCreditCardsModelImplCopyWith<$Res>
    implements $ListCreditCardsModelCopyWith<$Res> {
  factory _$$ListCreditCardsModelImplCopyWith(_$ListCreditCardsModelImpl value,
          $Res Function(_$ListCreditCardsModelImpl) then) =
      __$$ListCreditCardsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'all_conditions_link') String allConditionsLink,
      @JsonKey(name: 'bank_details') BankListDetailsModel? bankDetails,
      @JsonKey(name: 'bank_name') String bankName,
      bool best,
      @JsonKey(name: 'cashback_format') String cashbackFormat,
      @JsonKey(name: 'citizenship_russia') bool citizenshipRussia,
      CreditCardsConditionsModel? conditions,
      @JsonKey(name: 'credit_limit') int creditLimit,
      @JsonKey(name: 'credit_rates') List<String> creditRates,
      bool delivery,
      CreditCardsDescriptionsModel? descriptions,
      bool enable,
      List<String> features,
      String image,
      dynamic issue,
      @JsonKey(name: 'max_age') dynamic maxAge,
      @JsonKey(name: 'max_cashback') String maxCashBack,
      @JsonKey(name: 'max_cashback_percent') int maxCashbackPercent,
      @JsonKey(name: 'max_percent') double maxPercent,
      @JsonKey(name: 'max_service') int maxService,
      @JsonKey(name: 'max_sms') dynamic maxSms,
      @JsonKey(name: 'min_age') int minAge,
      @JsonKey(name: 'min_income') int minIncome,
      @JsonKey(name: 'min_percent') double minPercent,
      @JsonKey(name: 'min_service') int minService,
      @JsonKey(name: 'min_sms') int minSms,
      String name,
      @JsonKey(name: 'no_percent_period') int noPercentPeriod,
      @JsonKey(name: 'payment_system') String paymentSystem,
      bool popular,
      @JsonKey(name: 'ref_link') String refLink,
      @JsonKey(name: 'reg_russia') bool regRussia,
      int reissue,
      String slug,
      @JsonKey(name: 'with_refinancing') bool withRefinancing,
      @JsonKey(name: 'work_exp') String workExp});

  @override
  $BankListDetailsModelCopyWith<$Res>? get bankDetails;
  @override
  $CreditCardsConditionsModelCopyWith<$Res>? get conditions;
  @override
  $CreditCardsDescriptionsModelCopyWith<$Res>? get descriptions;
}

/// @nodoc
class __$$ListCreditCardsModelImplCopyWithImpl<$Res>
    extends _$ListCreditCardsModelCopyWithImpl<$Res, _$ListCreditCardsModelImpl>
    implements _$$ListCreditCardsModelImplCopyWith<$Res> {
  __$$ListCreditCardsModelImplCopyWithImpl(_$ListCreditCardsModelImpl _value,
      $Res Function(_$ListCreditCardsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? allConditionsLink = null,
    Object? bankDetails = freezed,
    Object? bankName = null,
    Object? best = null,
    Object? cashbackFormat = null,
    Object? citizenshipRussia = null,
    Object? conditions = freezed,
    Object? creditLimit = null,
    Object? creditRates = null,
    Object? delivery = null,
    Object? descriptions = freezed,
    Object? enable = null,
    Object? features = null,
    Object? image = null,
    Object? issue = freezed,
    Object? maxAge = freezed,
    Object? maxCashBack = null,
    Object? maxCashbackPercent = null,
    Object? maxPercent = null,
    Object? maxService = null,
    Object? maxSms = freezed,
    Object? minAge = null,
    Object? minIncome = null,
    Object? minPercent = null,
    Object? minService = null,
    Object? minSms = null,
    Object? name = null,
    Object? noPercentPeriod = null,
    Object? paymentSystem = null,
    Object? popular = null,
    Object? refLink = null,
    Object? regRussia = null,
    Object? reissue = null,
    Object? slug = null,
    Object? withRefinancing = null,
    Object? workExp = null,
  }) {
    return _then(_$ListCreditCardsModelImpl(
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
              as CreditCardsConditionsModel?,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as int,
      creditRates: null == creditRates
          ? _value._creditRates
          : creditRates // ignore: cast_nullable_to_non_nullable
              as List<String>,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as bool,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as CreditCardsDescriptionsModel?,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      issue: freezed == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxAge: freezed == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxCashBack: null == maxCashBack
          ? _value.maxCashBack
          : maxCashBack // ignore: cast_nullable_to_non_nullable
              as String,
      maxCashbackPercent: null == maxCashbackPercent
          ? _value.maxCashbackPercent
          : maxCashbackPercent // ignore: cast_nullable_to_non_nullable
              as int,
      maxPercent: null == maxPercent
          ? _value.maxPercent
          : maxPercent // ignore: cast_nullable_to_non_nullable
              as double,
      maxService: null == maxService
          ? _value.maxService
          : maxService // ignore: cast_nullable_to_non_nullable
              as int,
      maxSms: freezed == maxSms
          ? _value.maxSms
          : maxSms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      minIncome: null == minIncome
          ? _value.minIncome
          : minIncome // ignore: cast_nullable_to_non_nullable
              as int,
      minPercent: null == minPercent
          ? _value.minPercent
          : minPercent // ignore: cast_nullable_to_non_nullable
              as double,
      minService: null == minService
          ? _value.minService
          : minService // ignore: cast_nullable_to_non_nullable
              as int,
      minSms: null == minSms
          ? _value.minSms
          : minSms // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      noPercentPeriod: null == noPercentPeriod
          ? _value.noPercentPeriod
          : noPercentPeriod // ignore: cast_nullable_to_non_nullable
              as int,
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
      withRefinancing: null == withRefinancing
          ? _value.withRefinancing
          : withRefinancing // ignore: cast_nullable_to_non_nullable
              as bool,
      workExp: null == workExp
          ? _value.workExp
          : workExp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListCreditCardsModelImpl implements _ListCreditCardsModel {
  _$ListCreditCardsModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'all_conditions_link') this.allConditionsLink = '',
      @JsonKey(name: 'bank_details') this.bankDetails,
      @JsonKey(name: 'bank_name') this.bankName = '',
      this.best = false,
      @JsonKey(name: 'cashback_format') this.cashbackFormat = '',
      @JsonKey(name: 'citizenship_russia') this.citizenshipRussia = false,
      this.conditions,
      @JsonKey(name: 'credit_limit') this.creditLimit = 0,
      @JsonKey(name: 'credit_rates') final List<String> creditRates = const [],
      this.delivery = false,
      this.descriptions,
      this.enable = false,
      final List<String> features = const [],
      this.image = '',
      this.issue = 0,
      @JsonKey(name: 'max_age') this.maxAge = 0,
      @JsonKey(name: 'max_cashback') this.maxCashBack = '',
      @JsonKey(name: 'max_cashback_percent') this.maxCashbackPercent = 0,
      @JsonKey(name: 'max_percent') this.maxPercent = 0,
      @JsonKey(name: 'max_service') this.maxService = 0,
      @JsonKey(name: 'max_sms') this.maxSms = 0,
      @JsonKey(name: 'min_age') this.minAge = 0,
      @JsonKey(name: 'min_income') this.minIncome = 0,
      @JsonKey(name: 'min_percent') this.minPercent = 0,
      @JsonKey(name: 'min_service') this.minService = 0,
      @JsonKey(name: 'min_sms') this.minSms = 0,
      this.name = '',
      @JsonKey(name: 'no_percent_period') this.noPercentPeriod = 0,
      @JsonKey(name: 'payment_system') this.paymentSystem = '',
      this.popular = false,
      @JsonKey(name: 'ref_link') this.refLink = '',
      @JsonKey(name: 'reg_russia') this.regRussia = false,
      this.reissue = 0,
      this.slug = '',
      @JsonKey(name: 'with_refinancing') this.withRefinancing = false,
      @JsonKey(name: 'work_exp') this.workExp = ''})
      : _creditRates = creditRates,
        _features = features;

  factory _$ListCreditCardsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListCreditCardsModelImplFromJson(json);

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
  @JsonKey(name: 'cashback_format')
  final String cashbackFormat;
  @override
  @JsonKey(name: 'citizenship_russia')
  final bool citizenshipRussia;
  @override
  final CreditCardsConditionsModel? conditions;
  @override
  @JsonKey(name: 'credit_limit')
  final int creditLimit;
  final List<String> _creditRates;
  @override
  @JsonKey(name: 'credit_rates')
  List<String> get creditRates {
    if (_creditRates is EqualUnmodifiableListView) return _creditRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creditRates);
  }

  @override
  @JsonKey()
  final bool delivery;
  @override
  final CreditCardsDescriptionsModel? descriptions;
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
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final dynamic issue;
  @override
  @JsonKey(name: 'max_age')
  final dynamic maxAge;
  @override
  @JsonKey(name: 'max_cashback')
  final String maxCashBack;
  @override
  @JsonKey(name: 'max_cashback_percent')
  final int maxCashbackPercent;
  @override
  @JsonKey(name: 'max_percent')
  final double maxPercent;
  @override
  @JsonKey(name: 'max_service')
  final int maxService;
  @override
  @JsonKey(name: 'max_sms')
  final dynamic maxSms;
  @override
  @JsonKey(name: 'min_age')
  final int minAge;
  @override
  @JsonKey(name: 'min_income')
  final int minIncome;
  @override
  @JsonKey(name: 'min_percent')
  final double minPercent;
  @override
  @JsonKey(name: 'min_service')
  final int minService;
  @override
  @JsonKey(name: 'min_sms')
  final int minSms;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'no_percent_period')
  final int noPercentPeriod;
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
  @JsonKey(name: 'with_refinancing')
  final bool withRefinancing;
  @override
  @JsonKey(name: 'work_exp')
  final String workExp;

  @override
  String toString() {
    return 'ListCreditCardsModel(id: $id, allConditionsLink: $allConditionsLink, bankDetails: $bankDetails, bankName: $bankName, best: $best, cashbackFormat: $cashbackFormat, citizenshipRussia: $citizenshipRussia, conditions: $conditions, creditLimit: $creditLimit, creditRates: $creditRates, delivery: $delivery, descriptions: $descriptions, enable: $enable, features: $features, image: $image, issue: $issue, maxAge: $maxAge, maxCashBack: $maxCashBack, maxCashbackPercent: $maxCashbackPercent, maxPercent: $maxPercent, maxService: $maxService, maxSms: $maxSms, minAge: $minAge, minIncome: $minIncome, minPercent: $minPercent, minService: $minService, minSms: $minSms, name: $name, noPercentPeriod: $noPercentPeriod, paymentSystem: $paymentSystem, popular: $popular, refLink: $refLink, regRussia: $regRussia, reissue: $reissue, slug: $slug, withRefinancing: $withRefinancing, workExp: $workExp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListCreditCardsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.allConditionsLink, allConditionsLink) ||
                other.allConditionsLink == allConditionsLink) &&
            (identical(other.bankDetails, bankDetails) ||
                other.bankDetails == bankDetails) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.best, best) || other.best == best) &&
            (identical(other.cashbackFormat, cashbackFormat) ||
                other.cashbackFormat == cashbackFormat) &&
            (identical(other.citizenshipRussia, citizenshipRussia) ||
                other.citizenshipRussia == citizenshipRussia) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            const DeepCollectionEquality()
                .equals(other._creditRates, _creditRates) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.issue, issue) &&
            const DeepCollectionEquality().equals(other.maxAge, maxAge) &&
            (identical(other.maxCashBack, maxCashBack) ||
                other.maxCashBack == maxCashBack) &&
            (identical(other.maxCashbackPercent, maxCashbackPercent) ||
                other.maxCashbackPercent == maxCashbackPercent) &&
            (identical(other.maxPercent, maxPercent) ||
                other.maxPercent == maxPercent) &&
            (identical(other.maxService, maxService) ||
                other.maxService == maxService) &&
            const DeepCollectionEquality().equals(other.maxSms, maxSms) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.minIncome, minIncome) ||
                other.minIncome == minIncome) &&
            (identical(other.minPercent, minPercent) ||
                other.minPercent == minPercent) &&
            (identical(other.minService, minService) ||
                other.minService == minService) &&
            (identical(other.minSms, minSms) || other.minSms == minSms) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.noPercentPeriod, noPercentPeriod) ||
                other.noPercentPeriod == noPercentPeriod) &&
            (identical(other.paymentSystem, paymentSystem) ||
                other.paymentSystem == paymentSystem) &&
            (identical(other.popular, popular) || other.popular == popular) &&
            (identical(other.refLink, refLink) || other.refLink == refLink) &&
            (identical(other.regRussia, regRussia) ||
                other.regRussia == regRussia) &&
            (identical(other.reissue, reissue) || other.reissue == reissue) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.withRefinancing, withRefinancing) ||
                other.withRefinancing == withRefinancing) &&
            (identical(other.workExp, workExp) || other.workExp == workExp));
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
        cashbackFormat,
        citizenshipRussia,
        conditions,
        creditLimit,
        const DeepCollectionEquality().hash(_creditRates),
        delivery,
        descriptions,
        enable,
        const DeepCollectionEquality().hash(_features),
        image,
        const DeepCollectionEquality().hash(issue),
        const DeepCollectionEquality().hash(maxAge),
        maxCashBack,
        maxCashbackPercent,
        maxPercent,
        maxService,
        const DeepCollectionEquality().hash(maxSms),
        minAge,
        minIncome,
        minPercent,
        minService,
        minSms,
        name,
        noPercentPeriod,
        paymentSystem,
        popular,
        refLink,
        regRussia,
        reissue,
        slug,
        withRefinancing,
        workExp
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListCreditCardsModelImplCopyWith<_$ListCreditCardsModelImpl>
      get copyWith =>
          __$$ListCreditCardsModelImplCopyWithImpl<_$ListCreditCardsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListCreditCardsModelImplToJson(
      this,
    );
  }
}

abstract class _ListCreditCardsModel implements ListCreditCardsModel {
  factory _ListCreditCardsModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'all_conditions_link') final String allConditionsLink,
      @JsonKey(name: 'bank_details') final BankListDetailsModel? bankDetails,
      @JsonKey(name: 'bank_name') final String bankName,
      final bool best,
      @JsonKey(name: 'cashback_format') final String cashbackFormat,
      @JsonKey(name: 'citizenship_russia') final bool citizenshipRussia,
      final CreditCardsConditionsModel? conditions,
      @JsonKey(name: 'credit_limit') final int creditLimit,
      @JsonKey(name: 'credit_rates') final List<String> creditRates,
      final bool delivery,
      final CreditCardsDescriptionsModel? descriptions,
      final bool enable,
      final List<String> features,
      final String image,
      final dynamic issue,
      @JsonKey(name: 'max_age') final dynamic maxAge,
      @JsonKey(name: 'max_cashback') final String maxCashBack,
      @JsonKey(name: 'max_cashback_percent') final int maxCashbackPercent,
      @JsonKey(name: 'max_percent') final double maxPercent,
      @JsonKey(name: 'max_service') final int maxService,
      @JsonKey(name: 'max_sms') final dynamic maxSms,
      @JsonKey(name: 'min_age') final int minAge,
      @JsonKey(name: 'min_income') final int minIncome,
      @JsonKey(name: 'min_percent') final double minPercent,
      @JsonKey(name: 'min_service') final int minService,
      @JsonKey(name: 'min_sms') final int minSms,
      final String name,
      @JsonKey(name: 'no_percent_period') final int noPercentPeriod,
      @JsonKey(name: 'payment_system') final String paymentSystem,
      final bool popular,
      @JsonKey(name: 'ref_link') final String refLink,
      @JsonKey(name: 'reg_russia') final bool regRussia,
      final int reissue,
      final String slug,
      @JsonKey(name: 'with_refinancing') final bool withRefinancing,
      @JsonKey(name: 'work_exp')
      final String workExp}) = _$ListCreditCardsModelImpl;

  factory _ListCreditCardsModel.fromJson(Map<String, dynamic> json) =
      _$ListCreditCardsModelImpl.fromJson;

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
  @JsonKey(name: 'cashback_format')
  String get cashbackFormat;
  @override
  @JsonKey(name: 'citizenship_russia')
  bool get citizenshipRussia;
  @override
  CreditCardsConditionsModel? get conditions;
  @override
  @JsonKey(name: 'credit_limit')
  int get creditLimit;
  @override
  @JsonKey(name: 'credit_rates')
  List<String> get creditRates;
  @override
  bool get delivery;
  @override
  CreditCardsDescriptionsModel? get descriptions;
  @override
  bool get enable;
  @override
  List<String> get features;
  @override
  String get image;
  @override
  dynamic get issue;
  @override
  @JsonKey(name: 'max_age')
  dynamic get maxAge;
  @override
  @JsonKey(name: 'max_cashback')
  String get maxCashBack;
  @override
  @JsonKey(name: 'max_cashback_percent')
  int get maxCashbackPercent;
  @override
  @JsonKey(name: 'max_percent')
  double get maxPercent;
  @override
  @JsonKey(name: 'max_service')
  int get maxService;
  @override
  @JsonKey(name: 'max_sms')
  dynamic get maxSms;
  @override
  @JsonKey(name: 'min_age')
  int get minAge;
  @override
  @JsonKey(name: 'min_income')
  int get minIncome;
  @override
  @JsonKey(name: 'min_percent')
  double get minPercent;
  @override
  @JsonKey(name: 'min_service')
  int get minService;
  @override
  @JsonKey(name: 'min_sms')
  int get minSms;
  @override
  String get name;
  @override
  @JsonKey(name: 'no_percent_period')
  int get noPercentPeriod;
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
  @JsonKey(name: 'with_refinancing')
  bool get withRefinancing;
  @override
  @JsonKey(name: 'work_exp')
  String get workExp;
  @override
  @JsonKey(ignore: true)
  _$$ListCreditCardsModelImplCopyWith<_$ListCreditCardsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreditCardsConditionsModel _$CreditCardsConditionsModelFromJson(
    Map<String, dynamic> json) {
  return _CreditCardsConditionsModel.fromJson(json);
}

/// @nodoc
mixin _$CreditCardsConditionsModel {
  @JsonKey(name: 'add_requirements')
  String get addRequirements => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal => throw _privateConstructorUsedError;
  String get cashback => throw _privateConstructorUsedError;
  String get stocks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCardsConditionsModelCopyWith<CreditCardsConditionsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardsConditionsModelCopyWith<$Res> {
  factory $CreditCardsConditionsModelCopyWith(CreditCardsConditionsModel value,
          $Res Function(CreditCardsConditionsModel) then) =
      _$CreditCardsConditionsModelCopyWithImpl<$Res,
          CreditCardsConditionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'add_requirements') String addRequirements,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      String cashback,
      String stocks});
}

/// @nodoc
class _$CreditCardsConditionsModelCopyWithImpl<$Res,
        $Val extends CreditCardsConditionsModel>
    implements $CreditCardsConditionsModelCopyWith<$Res> {
  _$CreditCardsConditionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addRequirements = null,
    Object? cashWithdrawal = null,
    Object? cashback = null,
    Object? stocks = null,
  }) {
    return _then(_value.copyWith(
      addRequirements: null == addRequirements
          ? _value.addRequirements
          : addRequirements // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      cashback: null == cashback
          ? _value.cashback
          : cashback // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditCardsConditionsModelImplCopyWith<$Res>
    implements $CreditCardsConditionsModelCopyWith<$Res> {
  factory _$$CreditCardsConditionsModelImplCopyWith(
          _$CreditCardsConditionsModelImpl value,
          $Res Function(_$CreditCardsConditionsModelImpl) then) =
      __$$CreditCardsConditionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'add_requirements') String addRequirements,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      String cashback,
      String stocks});
}

/// @nodoc
class __$$CreditCardsConditionsModelImplCopyWithImpl<$Res>
    extends _$CreditCardsConditionsModelCopyWithImpl<$Res,
        _$CreditCardsConditionsModelImpl>
    implements _$$CreditCardsConditionsModelImplCopyWith<$Res> {
  __$$CreditCardsConditionsModelImplCopyWithImpl(
      _$CreditCardsConditionsModelImpl _value,
      $Res Function(_$CreditCardsConditionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addRequirements = null,
    Object? cashWithdrawal = null,
    Object? cashback = null,
    Object? stocks = null,
  }) {
    return _then(_$CreditCardsConditionsModelImpl(
      addRequirements: null == addRequirements
          ? _value.addRequirements
          : addRequirements // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      cashback: null == cashback
          ? _value.cashback
          : cashback // ignore: cast_nullable_to_non_nullable
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
class _$CreditCardsConditionsModelImpl implements _CreditCardsConditionsModel {
  _$CreditCardsConditionsModelImpl(
      {@JsonKey(name: 'add_requirements') this.addRequirements = '',
      @JsonKey(name: 'cash_withdrawal') this.cashWithdrawal = '',
      this.cashback = '',
      this.stocks = ''});

  factory _$CreditCardsConditionsModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreditCardsConditionsModelImplFromJson(json);

  @override
  @JsonKey(name: 'add_requirements')
  final String addRequirements;
  @override
  @JsonKey(name: 'cash_withdrawal')
  final String cashWithdrawal;
  @override
  @JsonKey()
  final String cashback;
  @override
  @JsonKey()
  final String stocks;

  @override
  String toString() {
    return 'CreditCardsConditionsModel(addRequirements: $addRequirements, cashWithdrawal: $cashWithdrawal, cashback: $cashback, stocks: $stocks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardsConditionsModelImpl &&
            (identical(other.addRequirements, addRequirements) ||
                other.addRequirements == addRequirements) &&
            (identical(other.cashWithdrawal, cashWithdrawal) ||
                other.cashWithdrawal == cashWithdrawal) &&
            (identical(other.cashback, cashback) ||
                other.cashback == cashback) &&
            (identical(other.stocks, stocks) || other.stocks == stocks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, addRequirements, cashWithdrawal, cashback, stocks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditCardsConditionsModelImplCopyWith<_$CreditCardsConditionsModelImpl>
      get copyWith => __$$CreditCardsConditionsModelImplCopyWithImpl<
          _$CreditCardsConditionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditCardsConditionsModelImplToJson(
      this,
    );
  }
}

abstract class _CreditCardsConditionsModel
    implements CreditCardsConditionsModel {
  factory _CreditCardsConditionsModel(
      {@JsonKey(name: 'add_requirements') final String addRequirements,
      @JsonKey(name: 'cash_withdrawal') final String cashWithdrawal,
      final String cashback,
      final String stocks}) = _$CreditCardsConditionsModelImpl;

  factory _CreditCardsConditionsModel.fromJson(Map<String, dynamic> json) =
      _$CreditCardsConditionsModelImpl.fromJson;

  @override
  @JsonKey(name: 'add_requirements')
  String get addRequirements;
  @override
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal;
  @override
  String get cashback;
  @override
  String get stocks;
  @override
  @JsonKey(ignore: true)
  _$$CreditCardsConditionsModelImplCopyWith<_$CreditCardsConditionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreditCardsDescriptionsModel _$CreditCardsDescriptionsModelFromJson(
    Map<String, dynamic> json) {
  return _CreditCardsDescriptionsModel.fromJson(json);
}

/// @nodoc
mixin _$CreditCardsDescriptionsModel {
  @JsonKey(name: 'add_services')
  String get addServices => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal => throw _privateConstructorUsedError;
  String get execution => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_percent')
  String get noPercent => throw _privateConstructorUsedError;
  String get rates => throw _privateConstructorUsedError;
  String get refinancing => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get transfers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCardsDescriptionsModelCopyWith<CreditCardsDescriptionsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardsDescriptionsModelCopyWith<$Res> {
  factory $CreditCardsDescriptionsModelCopyWith(
          CreditCardsDescriptionsModel value,
          $Res Function(CreditCardsDescriptionsModel) then) =
      _$CreditCardsDescriptionsModelCopyWithImpl<$Res,
          CreditCardsDescriptionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'add_services') String addServices,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      String execution,
      @JsonKey(name: 'no_percent') String noPercent,
      String rates,
      String refinancing,
      String result,
      String transfers});
}

/// @nodoc
class _$CreditCardsDescriptionsModelCopyWithImpl<$Res,
        $Val extends CreditCardsDescriptionsModel>
    implements $CreditCardsDescriptionsModelCopyWith<$Res> {
  _$CreditCardsDescriptionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addServices = null,
    Object? cashWithdrawal = null,
    Object? execution = null,
    Object? noPercent = null,
    Object? rates = null,
    Object? refinancing = null,
    Object? result = null,
    Object? transfers = null,
  }) {
    return _then(_value.copyWith(
      addServices: null == addServices
          ? _value.addServices
          : addServices // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as String,
      noPercent: null == noPercent
          ? _value.noPercent
          : noPercent // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as String,
      refinancing: null == refinancing
          ? _value.refinancing
          : refinancing // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditCardsDescriptionsModelImplCopyWith<$Res>
    implements $CreditCardsDescriptionsModelCopyWith<$Res> {
  factory _$$CreditCardsDescriptionsModelImplCopyWith(
          _$CreditCardsDescriptionsModelImpl value,
          $Res Function(_$CreditCardsDescriptionsModelImpl) then) =
      __$$CreditCardsDescriptionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'add_services') String addServices,
      @JsonKey(name: 'cash_withdrawal') String cashWithdrawal,
      String execution,
      @JsonKey(name: 'no_percent') String noPercent,
      String rates,
      String refinancing,
      String result,
      String transfers});
}

/// @nodoc
class __$$CreditCardsDescriptionsModelImplCopyWithImpl<$Res>
    extends _$CreditCardsDescriptionsModelCopyWithImpl<$Res,
        _$CreditCardsDescriptionsModelImpl>
    implements _$$CreditCardsDescriptionsModelImplCopyWith<$Res> {
  __$$CreditCardsDescriptionsModelImplCopyWithImpl(
      _$CreditCardsDescriptionsModelImpl _value,
      $Res Function(_$CreditCardsDescriptionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addServices = null,
    Object? cashWithdrawal = null,
    Object? execution = null,
    Object? noPercent = null,
    Object? rates = null,
    Object? refinancing = null,
    Object? result = null,
    Object? transfers = null,
  }) {
    return _then(_$CreditCardsDescriptionsModelImpl(
      addServices: null == addServices
          ? _value.addServices
          : addServices // ignore: cast_nullable_to_non_nullable
              as String,
      cashWithdrawal: null == cashWithdrawal
          ? _value.cashWithdrawal
          : cashWithdrawal // ignore: cast_nullable_to_non_nullable
              as String,
      execution: null == execution
          ? _value.execution
          : execution // ignore: cast_nullable_to_non_nullable
              as String,
      noPercent: null == noPercent
          ? _value.noPercent
          : noPercent // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as String,
      refinancing: null == refinancing
          ? _value.refinancing
          : refinancing // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
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
class _$CreditCardsDescriptionsModelImpl
    implements _CreditCardsDescriptionsModel {
  _$CreditCardsDescriptionsModelImpl(
      {@JsonKey(name: 'add_services') this.addServices = '',
      @JsonKey(name: 'cash_withdrawal') this.cashWithdrawal = '',
      this.execution = '',
      @JsonKey(name: 'no_percent') this.noPercent = '',
      this.rates = '',
      this.refinancing = '',
      this.result = '',
      this.transfers = ''});

  factory _$CreditCardsDescriptionsModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreditCardsDescriptionsModelImplFromJson(json);

  @override
  @JsonKey(name: 'add_services')
  final String addServices;
  @override
  @JsonKey(name: 'cash_withdrawal')
  final String cashWithdrawal;
  @override
  @JsonKey()
  final String execution;
  @override
  @JsonKey(name: 'no_percent')
  final String noPercent;
  @override
  @JsonKey()
  final String rates;
  @override
  @JsonKey()
  final String refinancing;
  @override
  @JsonKey()
  final String result;
  @override
  @JsonKey()
  final String transfers;

  @override
  String toString() {
    return 'CreditCardsDescriptionsModel(addServices: $addServices, cashWithdrawal: $cashWithdrawal, execution: $execution, noPercent: $noPercent, rates: $rates, refinancing: $refinancing, result: $result, transfers: $transfers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardsDescriptionsModelImpl &&
            (identical(other.addServices, addServices) ||
                other.addServices == addServices) &&
            (identical(other.cashWithdrawal, cashWithdrawal) ||
                other.cashWithdrawal == cashWithdrawal) &&
            (identical(other.execution, execution) ||
                other.execution == execution) &&
            (identical(other.noPercent, noPercent) ||
                other.noPercent == noPercent) &&
            (identical(other.rates, rates) || other.rates == rates) &&
            (identical(other.refinancing, refinancing) ||
                other.refinancing == refinancing) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.transfers, transfers) ||
                other.transfers == transfers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addServices, cashWithdrawal,
      execution, noPercent, rates, refinancing, result, transfers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditCardsDescriptionsModelImplCopyWith<
          _$CreditCardsDescriptionsModelImpl>
      get copyWith => __$$CreditCardsDescriptionsModelImplCopyWithImpl<
          _$CreditCardsDescriptionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditCardsDescriptionsModelImplToJson(
      this,
    );
  }
}

abstract class _CreditCardsDescriptionsModel
    implements CreditCardsDescriptionsModel {
  factory _CreditCardsDescriptionsModel(
      {@JsonKey(name: 'add_services') final String addServices,
      @JsonKey(name: 'cash_withdrawal') final String cashWithdrawal,
      final String execution,
      @JsonKey(name: 'no_percent') final String noPercent,
      final String rates,
      final String refinancing,
      final String result,
      final String transfers}) = _$CreditCardsDescriptionsModelImpl;

  factory _CreditCardsDescriptionsModel.fromJson(Map<String, dynamic> json) =
      _$CreditCardsDescriptionsModelImpl.fromJson;

  @override
  @JsonKey(name: 'add_services')
  String get addServices;
  @override
  @JsonKey(name: 'cash_withdrawal')
  String get cashWithdrawal;
  @override
  String get execution;
  @override
  @JsonKey(name: 'no_percent')
  String get noPercent;
  @override
  String get rates;
  @override
  String get refinancing;
  @override
  String get result;
  @override
  String get transfers;
  @override
  @JsonKey(ignore: true)
  _$$CreditCardsDescriptionsModelImplCopyWith<
          _$CreditCardsDescriptionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
