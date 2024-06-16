import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/pages/login_page.dart';
import 'package:fooddeliveryservice/pages/register_page.dart';

class LoginorRegister extends StatefulWidget {

  const LoginorRegister({super.key});

  @override

  State<LoginorRegister> createState() => _LoginOrRegisterState();

}

class _LoginOrRegisterState extends State<LoginorRegister> {

// initially, show login page

  bool showLoginPage = true;

// toggle between login and register page

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}