import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProductUrlStateProvider = StateProvider.autoDispose<String>((ref) {
  return 'debit_cards';
});