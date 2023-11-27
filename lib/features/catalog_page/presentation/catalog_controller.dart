import 'package:flutter_riverpod/flutter_riverpod.dart';

final productTypeFromCatalogStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});