import 'package:exam/res/strings.dart';
import 'package:exam/viewModel/employee_view_model.dart';
import 'package:exam/views/widgets/vacation_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VacationsPage extends StatefulWidget {
  @override
  _VacationsPageState createState() => _VacationsPageState();
}

class _VacationsPageState extends State<VacationsPage> {
  Language language = EnLanguage();

  @override
  Widget build(BuildContext context) {
    final employeeViewModel = Provider.of<EmployeeViewModel>(context);
    if (employeeViewModel.vacations == null && employeeViewModel.employee == null)
      return Center(child: CircularProgressIndicator());
    else if (employeeViewModel.vacations!.isEmpty)
      return Center(child: Text(language.noVacations));
    else
      return ListView(
        padding: EdgeInsets.all(5),
        children: [
          for (var vacation in employeeViewModel.vacations!)
            VacationCard(vacation: vacation, employee: employeeViewModel.employee!.firstWhere((element) => element.id == vacation.empId))
        ],
      );
  }
}
