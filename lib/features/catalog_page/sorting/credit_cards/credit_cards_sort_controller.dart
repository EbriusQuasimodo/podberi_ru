import 'package:flutter_riverpod/flutter_riverpod.dart';

/// сортировка  если мы зашли с главной страницы
final creditCardsSortFromHomePageStateProvider = StateProvider<List<String>>((ref) {
  return [];
});
/// сортировка  если мы зашли со странциы выбора типа продукта
final creditCardsSortFromSelectProductPageStateProvider = StateProvider<String>((ref) {
  return '';
});

