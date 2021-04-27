import 'package:exam/res/colors.dart';
import 'package:exam/res/strings.dart';
import 'package:exam/viewModel/login_view_model.dart';
import 'package:exam/views/main_page.dart';
import 'package:exam/views/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneEditingController = new TextEditingController();
  final TextEditingController _passwordEditingController = new TextEditingController();
  final Language language = EnLanguage();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double textFieldWidth = width > 300 ? 300 : width * 0.9;
    final userViewModel = Provider.of<LoginViewModel>(context);

    void login() async {
      if (await userViewModel.login(_phoneEditingController.text, _passwordEditingController.text)) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        showLongToast(context, language.invalidLogin, toastType: ToastType.error);
      }
    }

    return Directionality(
      textDirection: language.textDirection,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [AppColors.a, AppColors.b],
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 35),
                  Center(child: Padding(padding: const EdgeInsets.all(20), child: FlutterLogo(size: 150))),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(padding: const EdgeInsets.only(bottom: 10, right: 16), child: Text(language.appName, style: TextStyle(color: Colors.white, fontSize: 22))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: SizedBox(
                width: textFieldWidth,
                child: TextField(
                  decoration: InputDecoration(hintText: language.name, icon: Icon(Icons.account_circle)),
                  controller: _phoneEditingController,
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: textFieldWidth,
                child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(hintText: language.password, icon: Icon(Icons.lock)),
                    controller: _passwordEditingController),
              ),
            ),
            SizedBox(height: 40),
            Center(child: ElevatedButton(child: Text(language.login, style: Theme.of(context).textTheme.bodyText2), onPressed: login, style: ElevatedButton.styleFrom(minimumSize: Size(175, 40)))),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
