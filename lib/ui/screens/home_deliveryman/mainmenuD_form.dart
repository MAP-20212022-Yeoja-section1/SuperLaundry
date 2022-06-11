import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_screen.dart';
import 'package:superlaundry/ui/screens/deliveryOrder/delivery_order_screen.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_viewmodel.dart';

class mainMenuDForm extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => mainMenuDForm());

  @override
  _mainMenuDForm createState() => _mainMenuDForm();
}

class _mainMenuDForm extends State<mainMenuDForm> {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => deliGetOrderScreen()));
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
                      Text("Accepted Order",
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
                            builder: (context) =>
                                AcceptedDeliveryOrderScreen()));
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
                      Text("Delivery Order",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            ),
          ])),
    );
  }
}
