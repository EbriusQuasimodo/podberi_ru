class FiltersModel {
  final List<String>? banks;
  final List<String>? cashBack;
  final List<String>? paySystem;
  String? percents;
   String? noPercentPeriod;
  final List<String>? features;
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
  });
}
