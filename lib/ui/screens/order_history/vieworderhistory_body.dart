import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_screen.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_viewmodel.dart';
// import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_viewmodel.dart';
import 'package:map_mvvm/map_mvvm.dart';

class ViewOrderHistoryBody extends StatefulWidget {
  final OrdersModel post;

  ViewOrderHistoryBody({required this.post});

  @override
  ViewOrderHistoryBodyState createState() => ViewOrderHistoryBodyState();
}

class ViewOrderHistoryBodyState extends State<ViewOrderHistoryBody> {
  @override
  Widget build(BuildContext context) {
    return View<OrderHistoryViewModel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: Text('ORDER HISTORY'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderHistoryScreen()));
                  },
                  icon: Icon(Icons.chevron_left_sharp),
                  iconSize: 40.0,
                ),
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 31, 215, 169),
                foregroundColor: Colors.white,
                actions: <Widget>[],
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(167, 255, 235, 100),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(
                            "ORDER ID: " + widget.post.orderId,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: ListTile(
                          title: Text(
                            widget.post.orderStatus,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(156, 2, 56, 33)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(
                            "ORDER DETAILS",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text("Method: " + widget.post.deliveryMethod,
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text("Order date: " + widget.post.date,
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text("Order time: " + widget.post.time,
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text("Address: " + widget.post.address,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                                "Cleaning method: " + widget.post.cleanMethod,
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text("Weight: " + widget.post.weight,
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                                "Water temperature: " +
                                    widget.post.waterTemperature,
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                                "Price: " +
                                    "RM" +
                                    widget.post.totalPrice.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                                "Payment method: " + widget.post.paymentMethod,
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ));
  }
}
