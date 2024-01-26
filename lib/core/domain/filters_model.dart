class FiltersModel {
  final List<String>? banks;
  final List<String>? cashBack;
  final List<String>? paySystem;
   List<String>? features = [];
  int percents =0;
   String? noPercentPeriod;
   int? creditLimit;
  int? sum;
  String? term;
  String? sort;

  ///модель для передачи фильтров
  FiltersModel({
    this.banks,
    this.cashBack,
    this.paySystem,
    this.percents =0,
    this.noPercentPeriod,
    this.features,
    this.term,
    this.sum,
    this.creditLimit,
    this.sort,
  });
}
