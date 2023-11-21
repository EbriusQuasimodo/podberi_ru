import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/constants/local_storage_constants.dart';
import 'package:podberi_ru/core/utils/local_storage.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  Future _init() async {
    var darkMode = await LocalStorage.getBool(AppConstants.THEMEMODE);
    state = darkMode;
  }

  DarkModeNotifier() : super(false) {
    _init();
  }

  void toggle() {
    state = !state;
    LocalStorage.setBool(AppConstants.THEMEMODE, state);
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
