import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_form.dart';
import 'mainmenuD_app_bar.dart';

class mainMenuDScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => mainMenuDScreen());

  @override
  mainMenuDScreenState createState() => mainMenuDScreenState();
}

class mainMenuDScreenState extends State<mainMenuDScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const mainMenuDAppBar(),
        body: mainMenuDForm(),
      ),
    );
  }
}
