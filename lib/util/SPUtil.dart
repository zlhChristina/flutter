import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SPUtil {

  static Future<dynamic> getData(String key) async{
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
//    if (value is int) {
//      return prefs.setInt(key, value);
//    } else if (value is String) {
//      return prefs.get(key);
//    } else if (value is bool) {
//      return prefs.setBool(key, value);
//    } else {
//      String str = value == null ? "" : value.toString();
      return prefs.getString(key);
//    }

  }

  static Future<bool> saveData<T>(String key, T value) async{
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else {
      String str = value == null ? "" : value.toString();
      return prefs.setString(key, str);
    }
  }
}
