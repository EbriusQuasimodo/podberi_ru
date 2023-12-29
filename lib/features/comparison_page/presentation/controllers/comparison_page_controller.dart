import 'package:flutter_riverpod/flutter_riverpod.dart';
final comparisonProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});

final comparisonFirstDebitBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondDebitBankNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstCreditBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondCreditBankNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstZaimyBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondZaimyBankNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});
