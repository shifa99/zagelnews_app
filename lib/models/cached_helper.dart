import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {
  static SharedPreferences sharedPreferences;
  static Future<void> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(String key, bool isDark) async {
    return await sharedPreferences.setBool(key, isDark);
  }

  static bool getBoolean(String key) 
  {
    return sharedPreferences.getBool(key);
  }
}
