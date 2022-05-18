import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/registration/registration_form.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_form.dart';
import 'mainmenu_app_bar.dart';

class mainMenuScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => mainMenuScreen());

  @override
  mainMenuScreenState createState() => mainMenuScreenState();
}

class mainMenuScreenState extends State<mainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const mainMenuAppBar(),
        body: mainMenuForm(),
      ),
    );
  }
}
