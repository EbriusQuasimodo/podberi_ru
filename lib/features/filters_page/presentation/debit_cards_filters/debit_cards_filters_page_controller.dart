import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
/// фильтр банков если мы зашли с главной страницы
final debitCardsFilterBanksFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр банков если мы зашли со странциы выбора типа продукта
final debitCardsFilterBanksFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр кэшбека если мы зашли с главной страницы
final debitCardsFilterCashBackFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр кэшбека если мы зашли со странциы выбора типа продукта
final debitCardsFilterCashBackFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});

/// фильтр платежной системы если мы зашли с главной страницы
final debitCardsFilterPaySystemFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр платежной системы если мы зашли со странциы выбора типа продукта
final debitCardsFilterPaySystemFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доп. условия если мы зашли с главной страницы
final debitCardsFilterAdditionalConditionsFromHomePageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
/// фильтр доп. условия если мы зашли со странциы выбора типа продукта
final debitCardsFilterAdditionalConditionsFromSelectProductPageStateProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
