import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:developer';

class LocalDB {
  static const _infoKey = 'userInfo';

  static var appDB;

  static Future<void> initializeDB() async {
    try {
      await Hive.initFlutter();
      appDB = await Hive.openBox('AppData');
    } catch (e) {
      log("DB initialize DB Box error");
      log(e.toString());
      return null;
    }
  }

  static void saveUserInfoSharedPreference(String username,String password) {
    try {
      if (appDB != null) appDB.put(_infoKey, '$username\n$password');
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String?> getUserInfoSharedPreference() async {
    try {
      if (appDB != null) return await appDB.get(_infoKey);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static clearInfoKey() {
    try {
      if (appDB != null) appDB.delete(_infoKey);
    } catch (e) {
      log(e.toString());
    }
  }
}
