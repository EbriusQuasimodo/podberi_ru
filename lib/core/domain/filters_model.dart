class FiltersModel {
  final List<String>? banks;
  final List<String>? cashBack;
  final List<String>? paySystem;
   List<String>? features = [];
  String? percents;
   String? noPercentPeriod;
   int? creditLimit;
  String? term;

  ///модель для передачи фильтров
  FiltersModel({
    this.banks,
    this.cashBack,
    this.paySystem,
    this.percents,
    this.noPercentPeriod,
    this.features,
    this.term,
    this.creditLimit,
  });
}
