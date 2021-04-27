import 'package:exam/res/strings.dart';
import 'package:exam/viewModel/employee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/employee_card.dart';

class EmployeesPage extends StatefulWidget {
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  Language language = EnLanguage();

  @override
  Widget build(BuildContext context) {
    final employeeViewModel = Provider.of<EmployeeViewModel>(context);
    if (employeeViewModel.employee == null)
      return Center(child: CircularProgressIndicator());
    else if (employeeViewModel.employee!.isEmpty)
      return Center(child: Text(language.noEmployees));
    else
      return ListView(
        padding: EdgeInsets.all(5),
        children: [for (var employee in employeeViewModel.employee!) EmployeeCard(employee: employee)],
      );
  }
}
