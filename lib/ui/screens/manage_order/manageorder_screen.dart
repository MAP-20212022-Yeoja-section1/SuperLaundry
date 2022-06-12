import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_appbart.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_body.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_body.dart';

class ManageOrderScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => ManageOrderScreen());

  @override
  ManageOrderScreenState createState() => ManageOrderScreenState();
}

class ManageOrderScreenState extends State<ManageOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ManageOrderAppBar(),
        body: ManageOrderBody(),
      ),
    );
  }
}
