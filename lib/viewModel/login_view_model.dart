import 'dart:convert';
import 'dart:developer';

import 'package:exam/api/user_api.dart';
import 'package:exam/util/application_database.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  Future<bool> login(String username, String password) async {
    try {
      String response = await UserApi.login(username, password);
      var decodedResponse = jsonDecode(response);
      log(decodedResponse.toString());
      if (decodedResponse['id'] != -1) {
        LocalDB.saveUserInfoSharedPreference(username, password);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
