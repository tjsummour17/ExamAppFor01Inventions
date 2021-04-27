import 'package:exam/model/employee.dart';
import 'package:exam/res/strings.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final Language language = EnLanguage();
  final mainPadding = SizedBox(width: 10, height: 10);

  EmployeeCard({Key? key, required this.employee}) : super(key: key);

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
          Text('# ${employee.id}', style: TextStyle(fontWeight: FontWeight.bold)),
          mainPadding,
          Text('${language.name}: ${employee.firstName} ${employee.lastName}', style: TextStyle(fontWeight: FontWeight.bold)),
          mainPadding,
          Text('${language.position}: ${employee.position}'),
          mainPadding,
          Text('${language.birthDate}: ${employee.birthDate}'),
          mainPadding,
          Text('${language.contractDate}: ${employee.contractDate}'),
          mainPadding,
          Text('${language.numVacations}: ${employee.vacations}', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
