import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:exam/viewModel/employee_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'res/colors.dart';
import 'viewModel/login_view_model.dart';
import 'views/login_page.dart';
import 'views/main_page.dart';

class MyMaterialApp extends StatefulWidget {
  final bool isUserLoggedIn;

  const MyMaterialApp({Key? key, required this.isUserLoggedIn}) : super(key: key);

  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {


  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: AppColors.a,
      100: AppColors.a,
      200: AppColors.a,
      300: AppColors.a,
      400: AppColors.a,
      500: AppColors.a,
      600: AppColors.a,
      700: AppColors.a,
      800: AppColors.b,
      900: AppColors.b
    };
    MaterialColor primaryAppColor = MaterialColor(AppColors.a.value, color);
    Map<int, Color> colorDark = {
      50: AppColors.c,
      100: AppColors.c,
      200: AppColors.c,
      300: AppColors.c,
      400: AppColors.c,
      500: AppColors.c,
      600: AppColors.c,
      700: AppColors.a,
      800: AppColors.a,
      900: AppColors.a
    };
    MaterialColor primaryAppColorDark = MaterialColor(AppColors.a.value, colorDark);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => LoginViewModel()),ChangeNotifierProvider(create: (context) => EmployeeViewModel()),],
      builder: (BuildContext context, __) => AdaptiveTheme(
        initial: AdaptiveThemeMode.system,
        dark: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                focusColor: AppColors.b,
                filled: true,
                fillColor: Colors.grey[600],
                suffixStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
            buttonTheme: ButtonThemeData(buttonColor: AppColors.b),
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
                headline6: TextStyle(color: AppColors.c, fontSize: 20, fontWeight: FontWeight.bold),
                headline1: TextStyle(color: AppColors.c, fontSize: 28, fontWeight: FontWeight.bold),
                bodyText2: TextStyle(color: Colors.white, fontSize: 16),
                bodyText1: TextStyle(color: Colors.white, fontSize: 18)),
            cupertinoOverrideTheme: CupertinoThemeData(textTheme: CupertinoTextThemeData(textStyle: TextStyle(color: Colors.white))),
            primarySwatch: primaryAppColorDark,
            accentColor: primaryAppColor,
            appBarTheme: AppBarTheme(color: AppColors.a),
            scaffoldBackgroundColor: Colors.grey[700]),
        light: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                filled: true,
                fillColor: Colors.white,
                suffixStyle: TextStyle(color: Colors.black),
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            brightness: Brightness.light,
            elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
            buttonTheme: ButtonThemeData(buttonColor: AppColors.a),
            textTheme: TextTheme(
              headline6: TextStyle(color: AppColors.a, fontSize: 20, fontWeight: FontWeight.bold),
              headline1: TextStyle(color: AppColors.a, fontSize: 28, fontWeight: FontWeight.bold),
              bodyText2: TextStyle(color: Colors.black, fontSize: 16),
              bodyText1: TextStyle(color: Colors.black, fontSize: 18),
            ),
            cupertinoOverrideTheme: CupertinoThemeData(textTheme: CupertinoTextThemeData(textStyle: TextStyle(color: Colors.black))),
            primarySwatch: primaryAppColor,
            accentColor: primaryAppColor),
        builder: (ThemeData light, ThemeData dark) => MaterialApp(theme: light, darkTheme: dark, home: widget.isUserLoggedIn ? MainPage() : LoginPage()),
      ),
    );
  }
}
