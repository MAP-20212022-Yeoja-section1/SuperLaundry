import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_screen.dart';
import 'package:superlaundry/ui/screens/cust_review/cust_review_screen.dart';
import 'package:superlaundry/ui/screens/add_order/add_order_screen.dart';
import 'package:superlaundry/ui/screens/add_order/order_payment_screen.dart';
import 'package:superlaundry/ui/screens/registration/registration_viewmodel.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_viewmodel.dart';
import 'package:superlaundry/ui/screens/print_invoice/print_invoice.dart';

class mainMenuForm extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => mainMenuForm());

  @override
  _mainMenuForm createState() => _mainMenuForm();
}

class _mainMenuForm extends State<mainMenuForm> {
  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(50.0),
          child: GridView.count(crossAxisCount: 2, children: <Widget>[
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddOrderScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 70.0,
                      ),
                      Text("Add Order", style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 70.0,
                      ),
                      Text("View Super Laundry Details",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderHistoryScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 70.0,
                      ),
                      Text("View Order History",
                          style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 70.0,
                      ),
                      Text("View Order Status",
                          style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustReviewScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 70.0,
                      ),
                      Text("Leave Review & Rating",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PrintInvoiceScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 70.0,
                      ),
                      Text("Generate Invoice",
                          style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
          ])),
    );
  }
}
