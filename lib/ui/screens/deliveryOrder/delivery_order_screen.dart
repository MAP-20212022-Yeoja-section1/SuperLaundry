// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'delivery_order_appbar.dart';
import 'delivery_order_body.dart';

class AcceptedDeliveryOrderScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> AcceptedDeliveryOrderScreen());

  @override
  AcceptedDeliveryOrderScreenState createState() => AcceptedDeliveryOrderScreenState();
}

class AcceptedDeliveryOrderScreenState extends State<AcceptedDeliveryOrderScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AcceptedDeliveryOrderAppBar(),
        body: AcceptedDeliveryOrderBody(),
      ),
    );
  }
}