import 'package:flutter/material.dart';
import 'laundryser_appbar.dart';
import 'laundryser_body.dart';

class LaundrySerScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> LaundrySerScreen());

  @override
  LaundrySerScreenState createState() => LaundrySerScreenState();
}

class LaundrySerScreenState extends State<LaundrySerScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const LaundrySerAppBar(),
        body: LaundrySerBody(),
      ),
    );
  }
}