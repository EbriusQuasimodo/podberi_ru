import 'package:flutter_riverpod/flutter_riverpod.dart';
final comparisonProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});

///дебетовки
final comparisonFirstDebitBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondDebitBankNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstDebitProductNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondDebitProductNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstDebitPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final comparisonSecondDebitPageNumStateController = StateProvider.autoDispose<int>((ref) {
  return 0;
});

///кредитки
final comparisonFirstCreditBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondCreditBankNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstCreditProductNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondCreditProductNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstCreditPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final comparisonSecondCreditPageNumStateController = StateProvider.autoDispose<int>((ref) {
  return 0;
});

///займы
final comparisonFirstZaimyBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondZaimyBankNameStateController = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstZaimyPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final comparisonSecondZaimyPageNumStateController = StateProvider.autoDispose<int>((ref) {
  return 0;
});
