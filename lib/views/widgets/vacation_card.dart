import 'package:exam/model/vacations.dart';
import 'package:exam/model/employee.dart';
import 'package:exam/res/const.dart';
import 'package:exam/res/strings.dart';
import 'package:exam/viewModel/employee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VacationCard extends StatelessWidget {
  final Vacation vacation;
  final Employee employee;
  final Language language = EnLanguage();
  final mainPadding = SizedBox(width: 10, height: 10);

  VacationCard({Key? key, required this.vacation, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('# ${vacation.id}', style: TextStyle(fontWeight: FontWeight.bold)),
          mainPadding,
          Text('${language.employeeName}: ${employee.firstName} ${employee.lastName}', style: TextStyle(fontWeight: FontWeight.bold)),
          mainPadding,
          Text('${DateFormat(Const.dateFormat).format(vacation.fromDate)} - ${DateFormat(Const.dateFormat).format(vacation.toDate)}'),
          mainPadding,
          Text('${language.numVacations}:'),
          SizedBox(height: 5),
          Row(
            children: [
              mainPadding,
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(25), right: Radius.circular(employee.vacations == Const.numOfVacation ? 25 : 0)),
                      color: Theme.of(context).accentColor),
                  width: employee.vacations * 15,
                  height: 30),
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.horizontal(right: Radius.circular(25)), color: Colors.grey), width: (Const.numOfVacation - employee.vacations) * 15, height: 30),
              mainPadding,
              Text('${employee.vacations} / ${Const.numOfVacation}')
            ],
          ),
          mainPadding,
          Row(
            children: [
              Expanded(child: SizedBox()),
              ElevatedButton(
                child: Text(language.approveLeave),
                onPressed: (employee.vacations + vacation.toDate.difference(vacation.fromDate).inDays) < 14 &&
                    (vacation.isApproved == null || !vacation.isApproved!)
                    ? () {
                        employee.vacations += vacation.toDate.difference(vacation.fromDate).inDays;
                        vacation.isApproved = true;
                        Provider.of<EmployeeViewModel>(context, listen: false).notifyListeners();
                      }
                    : null,
              ),
            ],
          )
        ],
      ),
    );
  }
}
