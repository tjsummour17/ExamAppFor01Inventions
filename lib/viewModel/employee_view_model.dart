import 'dart:convert';
import 'dart:developer';

import 'package:exam/api/employee_api.dart';
import 'package:exam/model/employee.dart';
import 'package:exam/model/vacations.dart';
import 'package:flutter/cupertino.dart';

class EmployeeViewModel extends ChangeNotifier {
  List<Employee>? _employees;

  List<Employee>? get employee => _employees;

  List<Vacation>? _vacations;

  List<Vacation>? get vacations => _vacations;

  static List<Employee> _parseResponseToListOfEmployees(String responseBody) => jsonDecode(responseBody).map<Employee>((json) => Employee.fromJson(json)).toList();

  static List<Vacation> _parseResponseToListOfVacations(String responseBody) => jsonDecode(responseBody).map<Vacation>((json) => Vacation.fromJson(json)).toList();

  @override
  notifyListeners(){
    super.notifyListeners();
  }

  Future fetchAllEmployees() async {
    try {
      _employees = _parseResponseToListOfEmployees(await EmployeeApi.getEmployees().timeout(Duration(seconds: 10)));
      notifyListeners();
    } catch (e) {
      _employees = [];
      log(e.toString());
    }
  }

  Future fetchAllVacations() async {
    try {
      String res = await EmployeeApi.getVacations().timeout(Duration(seconds: 10));
      log(res);
      _vacations = _parseResponseToListOfVacations(res);
      notifyListeners();
    } catch (e) {
      _vacations = [];
      log(e.toString());
    }
  }
}
