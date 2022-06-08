import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/models/order.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_viewmodel.dart';
import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_body.dart';
import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_screen.dart';
import 'package:intl/intl.dart';

class OrderHistoryBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => OrderHistoryBody());

  @override
  _OrderHistoryBody createState() => _OrderHistoryBody();
}

class _OrderHistoryBody extends State<OrderHistoryBody> {
  @override
  Widget build(BuildContext Context) {
    return View<OrderHistoryViewModel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<OrderModel>>(
                stream: viewmodel.readOrderHistory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final order = snapshot.data!;
                    return Row(children: <Widget>[
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: order.map((order) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(11, 181, 142, 100),
                                    )),
                                margin:
                                    EdgeInsets.fromLTRB(22.0, 1.0, 20.0, 2.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                      title: Text(
                                        'Order ID: ' + order.orderId,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      subtitle:
                                          Text(order.date + " | " + order.time),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewOrderHistoryBody(
                                                          post: order)));
                                        },
                                        icon: Icon(Icons.chevron_right_sharp),
                                        iconSize: 35.0,
                                        color:
                                            Color.fromRGBO(11, 181, 142, 100),
                                      )),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
