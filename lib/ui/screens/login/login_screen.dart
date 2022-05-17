import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/login/login_form.dart';
import 'login_app_bar.dart';

class LoginScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const LoginAppBar(),
        body: LoginForm(),
      ),
    );
  }
}
