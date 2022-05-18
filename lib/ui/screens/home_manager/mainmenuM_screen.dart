import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/registration/registration_form.dart';
import 'package:superlaundry/ui/screens/home_manager/mainmenuM_form.dart';
import 'mainmenuM_app_bar.dart';

class mainMenuMScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => mainMenuMScreen());

  @override
  mainMenuMScreenState createState() => mainMenuMScreenState();
}

class mainMenuMScreenState extends State<mainMenuMScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const mainMenuMAppBar(),
        body: mainMenuMForm(),
      ),
    );
  }
}
