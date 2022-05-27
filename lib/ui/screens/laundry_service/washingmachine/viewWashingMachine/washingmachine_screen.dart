import 'package:flutter/material.dart';
import 'washingmachine_appbar.dart';
import 'washingmachine_body.dart';

class WashingMachineScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> WashingMachineScreen());

  @override
  WashingMachineState createState() => WashingMachineState();
}

class WashingMachineState extends State<WashingMachineScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const WashingMachineAppBar(),
        body: WashingMachineBody(),
      ),
    );
  }
}