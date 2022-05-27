import 'package:flutter/material.dart';
import 'deliveryser_appbar.dart';
import 'deliveryser_body.dart';

class DeliveryScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> DeliveryScreen());

  @override
  DeliveryScreenState createState() => DeliveryScreenState();
}

class DeliveryScreenState extends State<DeliveryScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DeliveryAppBar(),
        body: DeliveryBody(),
      ),
    );
  }
}