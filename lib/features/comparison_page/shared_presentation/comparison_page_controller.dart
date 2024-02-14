import 'package:flutter_riverpod/flutter_riverpod.dart';
final comparisonProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});

///дебетовки
final comparisonFirstDebitBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondDebitBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstDebitProductNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondDebitProductNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonDebitListLengthStateController = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final comparisonFirstDebitPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final comparisonSecondDebitPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
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
final comparisonSecondCreditPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final comparisonCreditListLengthStateController = StateProvider.autoDispose<int>((ref) {
  return 0;
});

///rko
final comparisonFirstRkoBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondRkoBankNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonFirstRkoProductNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final comparisonSecondRkoProductNameStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final comparisonRkoListLengthStateController = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final comparisonFirstRkoPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final comparisonSecondRkoPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
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
final comparisonSecondZaimyPageNumStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final comparisonZaimyListLengthStateController = StateProvider.autoDispose<int>((ref) {
  return 0;
});
