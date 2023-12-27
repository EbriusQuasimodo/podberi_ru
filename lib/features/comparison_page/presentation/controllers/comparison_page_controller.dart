import 'package:flutter_riverpod/flutter_riverpod.dart';
final comparisonProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});

final comparisonFirstProductDescriptionStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondProductDescriptionStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});
