import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String defValue = '']) {
    return _prefsInstance!.getString(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static int getInt(String key, [int defValue = -1]) {
    return _prefsInstance!.getInt(key) ?? defValue;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static List<String> getList(String key, [List<String> defValue = const []]) {
    return _prefsInstance!.getStringList(key) ?? defValue;
  }

  static Future<bool> setList(String key, List<String> value) async {
    var prefs = await _instance;
    return prefs.setStringList(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }
}
