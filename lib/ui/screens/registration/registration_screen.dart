import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/registration/registration_form.dart';
import 'registration_app_bar.dart';

class RegistrationScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> RegistrationScreen());

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const RegistrationAppBar(),
        body: RegistrationForm(),
      ),
    );
  }
}