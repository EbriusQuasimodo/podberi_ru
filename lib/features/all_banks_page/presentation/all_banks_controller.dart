import 'package:flutter_riverpod/flutter_riverpod.dart';

final bankFromAllBanksStateProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});