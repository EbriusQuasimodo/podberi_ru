import 'package:flutter_riverpod/flutter_riverpod.dart';

/// фильтр срока займа если мы зашли с главной страницы
final zaimyFilterTermFromHomePageStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
/// фильтр срока займа если мы зашли со странциы выбора типа продукта
final zaimyFilterTermFromSelectProductPageStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
/// фильтр суммы займа если мы зашли с главной страницы
final zaimyFilterSumFromHomePageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
/// фильтр суммы займа если мы зашли со странциы выбора типа продукта
final zaimyFilterSumFromSelectProductPageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
/// фильтр процентной ставки если мы зашли с главной страницы
final zaimyFilterPercentsFromHomePageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
/// фильтр процентной ставки если мы зашли со странциы выбора типа продукта
final zaimyFilterPercentsFromSelectProductPageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});