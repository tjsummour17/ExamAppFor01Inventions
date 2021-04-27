import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:exam/res/strings.dart';
import 'package:exam/viewModel/employee_view_model.dart';
import 'package:exam/views/employee_page.dart';
import 'package:exam/views/vacations_page.dart';
import 'package:exam/views/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Language language = EnLanguage();
  Widget currentPage = EmployeesPage();
  int currentIndex = 0;
  @override
  void initState() {
    Provider.of<EmployeeViewModel>(context, listen: false).fetchAllEmployees();
    Provider.of<EmployeeViewModel>(context, listen: false).fetchAllVacations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Directionality(
      textDirection: language.textDirection,
      child: Scaffold(
        appBar: AppBar(
          title: Text(language.appName),
          actions: [
            Row(children: [
              Text(isDarkTheme ? language.dark : language.light, style: TextStyle(fontWeight: FontWeight.bold)),
              Switch(
                value: isDarkTheme,
                onChanged: (v) => isDarkTheme ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark(),
              )
            ])
          ],
        ),
        body: currentPage,
        bottomNavigationBar: BottomNavBar(
          selectedIndex: currentIndex,
          showElevation: false,
          itemCornerRadius: 24,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          curve: Curves.easeOutCubic,
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
              currentPage = index == 0 ? EmployeesPage() : VacationsPage();
            });
          },
          items: [BottomNavBarItem(icon: Icon(Icons.account_box), title: Text(language.employees)), BottomNavBarItem(icon: Icon(Icons.weekend), title: Text(language.vacations))],
        ),
      ),
    );
  }
}
