import 'package:flutter/material.dart';
import 'cleanser_appbar.dart';
import 'cleanser_body.dart';

class CleanScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> CleanScreen());

  @override
  CleanScreenState createState() => CleanScreenState();
}

class CleanScreenState extends State<CleanScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CleanAppBar(),
        body: CleanBody(),
      ),
    );
  }
}