import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// фильтр безпроцентного периода если мы зашли с главной страницы
final creditCardsFilterNoPercentPeriodFromHomePageStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
/// фильтр безпроцентного периода если мы зашли со странциы выбора типа продукта
final creditCardsFilterNoPercentPeriodFromSelectProductPageStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
/// фильтр кредитного лимита если мы зашли с главной страницы
final creditCardsFilterCreditLimitFromHomePageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
/// фильтр кредитного лимита если мы зашли со странциы выбора типа продукта
final creditCardsFilterCreditLimitFromSelectProductPageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
/// фильтр процентной ставки если мы зашли с главной страницы
final creditCardsFilterPercentsFromHomePageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
/// фильтр процентной ставки если мы зашли со странциы выбора типа продукта
final creditCardsFilterPercentsFromSelectProductPageStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

/// фильтр платежной системы если мы зашли с главной страницы
final creditCardsFilterPaySystemFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр платежной системы если мы зашли со странциы выбора типа продукта
final creditCardsFilterPaySystemFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доп. условия если мы зашли с главной страницы
final creditCardsFilterAdditionalConditionsFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доп. условия если мы зашли со странциы выбора типа продукта
final creditCardsFilterAdditionalConditionsFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
