// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_body.dart';
import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_app_bar.dart';

class deliGetOrderScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => deliGetOrderScreen());

  @override
  deliGetOrderScreenState createState() => deliGetOrderScreenState();
}

class deliGetOrderScreenState extends State<deliGetOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const deliGetOrderAppBar(),
        body: deliGetOrderBody(),
      ),
    );
  }
}
