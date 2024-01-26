import 'package:flutter_riverpod/flutter_riverpod.dart';

/// сортировка  если мы зашли с главной страницы
final sortFromHomePageStateProvider = StateProvider<String>((ref) {
  return 'По умолчанию';
});
/// сортировка  если мы зашли со странциы выбора типа продукта
final sortFromSelectProductPageStateProvider = StateProvider<String>((ref) {
  return 'По умолчанию';
});
