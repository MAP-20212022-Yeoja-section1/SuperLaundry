import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_viewmodel.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorderdetails_body.dart';

class ManageOrderBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => ManageOrderBody());

  @override
  _ManageOrderBody createState() => _ManageOrderBody();
}

class _ManageOrderBody extends State<ManageOrderBody> {
  @override
  Widget build(BuildContext context) {
    return View<ManageOrderViewModel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<OrdersModel>>(
                stream: viewmodel.readAllOrders(),
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
                                    EdgeInsets.fromLTRB(12.0, 1.0, 12.0, 2.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    // leading: Text("PENDING" +
                                    //     " (" +
                                    //     order.orderStatus +
                                    //     ")"),
                                    title: Text(
                                      'Order ID: ' + order.orderId,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    subtitle:
                                        Text(order.date + " | " + order.time),
                                    trailing: Text(
                                      "PENDING",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(111, 48, 49, 41)),
                                    ),

                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ManageOrderDetailsBody(
                                                      post: order)));
                                    },
                                  ),
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
