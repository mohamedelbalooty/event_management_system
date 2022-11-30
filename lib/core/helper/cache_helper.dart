import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _preferences;

  const CacheHelper({required SharedPreferences preferences})
      : _preferences = preferences;

  Future<bool> setStringData(
      {required String key, required String value}) async =>
      await _preferences.setString(key, value);

  String? getStringData({required String key}) => _preferences.getString(key);

  Future<bool> setIntData({required String key, required int value}) async =>
      await _preferences.setInt(key, value);

  int? getIntData({required String key}) => _preferences.getInt(key);

  Future<bool> setDoubleData(
      {required String key, required double value}) async =>
      await _preferences.setDouble(key, value);

  double? getDoubleData({required String key}) => _preferences.getDouble(key);

  Future<bool> setBoolData({required String key, required bool value}) async =>
      await _preferences.setBool(key, value);

  bool? getBoolData({required String key}) => _preferences.getBool(key);
}