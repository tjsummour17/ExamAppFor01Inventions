import 'package:flutter/cupertino.dart';

abstract class Language {
  TextDirection get textDirection;

  String get appName;

  String get password;

  String get login;

  String get name;

  String get vacations;

  String get birthDate;

  String get intro;

  String get about;

  String get pleaseSignInToYourAccount;

  String get ok;

  String get cancel;

  String get settings;

  String get language;

  String get lang;

  String get theme;

  String get light;

  String get dark;

  String get users;

  String get invalidLogin;

  String get rememberMe;

  String get forgetPassword;

  String get employees;

  String get pleaseEnterPass;

  String get noEmployees;

  String get contractDate;

  String get position;

  String get numVacations;

  String get employeeName;

  String get noVacations;

  String get approveLeave;
}

class EnLanguage extends Language {
  @override
  String get about => 'About';

  @override
  String get appName => 'Exam App';

  @override
  String get birthDate => 'Birthday';

  @override
  String get cancel => 'Cancel';

  @override
  String get dark => 'Dark Theme';

  @override
  String get vacations => 'Vacations';

  @override
  String get intro => 'In fact 123 Flash Chat is very easy to use, just log in and chat with friends, meet new people...however, it will make your chat easier and funnier.';

  @override
  String get invalidLogin => 'Invalid login credentials';

  @override
  String get lang => 'عربي';

  @override
  String get language => 'Language';

  @override
  String get light => 'Light Theme';

  @override
  String get login => 'Sign in';

  @override
  String get name => 'Name';

  @override
  String get ok => 'OK';

  @override
  String get password => 'Password';

  @override
  String get pleaseSignInToYourAccount => 'Please Sign in to your account';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get users => 'Users';

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get rememberMe => 'Remember Me';

  @override
  String get forgetPassword => 'Forget Password?';

  @override
  String get employees => 'Employees';

  @override
  String get pleaseEnterPass => 'Please enter password';

  @override
  String get noEmployees => 'There is no Employees';

  @override
  String get contractDate => 'Contract Date';

  @override
  String get position => 'Position';

  @override
  String get numVacations => 'Number Of Leaves';

  @override
  String get employeeName => 'Employee Name';

  @override
  String get noVacations => 'There is no Vacations';

  @override
  String get approveLeave => 'Approve Leave';
}
