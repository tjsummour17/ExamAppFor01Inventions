import 'dart:developer';

import 'package:exam/my_material.dart';
import 'package:flutter/material.dart';

import 'util/application_database.dart';
import 'viewModel/login_view_model.dart';

String userInfo = '';

Future checkIfUserLoggedIn() async {
  try {
    await LocalDB.initializeDB();
    userInfo = (await LocalDB.getUserInfoSharedPreference()) ?? '';
    if (userInfo.isNotEmpty) {
      LoginViewModel _userViewModel = LoginViewModel();
      String username = userInfo.split('\n')[0];
      String password = userInfo.split('\n')[1];
      if (!(await _userViewModel.login(username, password))) userInfo = '';
    }
  } catch (e) {
    log(e.toString());
    userInfo = '';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfUserLoggedIn();
  runApp(MyMaterialApp(isUserLoggedIn: userInfo.isNotEmpty));
}
