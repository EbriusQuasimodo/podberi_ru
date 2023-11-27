import 'package:flutter_riverpod/flutter_riverpod.dart';

final productTypeFromHomeStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});