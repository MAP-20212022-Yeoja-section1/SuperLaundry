import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_appbar.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_body.dart';
// import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_appbar.dart';
// import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_body.dart';
import 'orderhistory_appbar.dart';

class OrderHistoryScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => OrderHistoryScreen());

  @override
  OrderHistoryScreenState createState() => OrderHistoryScreenState();
}

class OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const OrderHistoryAppBar(),
        body: OrderHistoryBody(),
      ),
    );
  }
}
