class FiltersModel {
  FiltersModel({
    this.banks,
    this.cashBack,
    this.paySystem,
    this.percents = 0,
    this.noPercentPeriod,
    this.features,
    this.term,
    this.sum =0,
    this.creditLimit=0,
    this.sort,
  });

  List<String>? banks;
  List<String>? cashBack;
  List<String>? paySystem;
  List<String>? features = [];
  int? percents = 0;
  String? noPercentPeriod;
  int? creditLimit=0;
  int? sum =0;
  String? term;
  String? sort;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FiltersModel &&
        other.banks == banks &&
        other.cashBack == cashBack &&
        other.paySystem == paySystem &&
        other.features == features &&
        other.percents == percents &&
        other.noPercentPeriod == noPercentPeriod &&
        other.creditLimit == creditLimit &&
        other.sum == sum &&
        other.term == term &&
        other.sort == sort;
  }

  @override
  int get hashCode =>
      banks.hashCode ^
      cashBack.hashCode ^
      paySystem.hashCode ^
      features.hashCode ^
      percents.hashCode ^
      noPercentPeriod.hashCode ^
      creditLimit.hashCode ^
      sum.hashCode ^
      term.hashCode ^
      sort.hashCode;
}
