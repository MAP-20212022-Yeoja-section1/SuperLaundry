import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:superlaundry/models/order.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_screen.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_viewmodel.dart';
import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_viewmodel.dart';
import 'package:map_mvvm/map_mvvm.dart';

class ViewOrderHistoryBody extends StatefulWidget {
  final OrderModel post;

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
                // decoration: BoxDecoration(
                //   color: Color.fromRGBO(167, 255, 235, 100),
                // ),
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
                            "Order ID: " + widget.post.orderId,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
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
                      SizedBox(height: 20.0),
                      Text("Method: " + widget.post.method,
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      SizedBox(height: 5.0),
                      Text("Order date: " + widget.post.date,
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      SizedBox(height: 5.0),
                      Text("Order time: " + widget.post.time,
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      SizedBox(height: 5.0),
                      // Text("Delivery method: " + widget.post.deliveryMethod,
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //     )),
                      // SizedBox(height: 5.0),
                      // Text("Clean method: " + widget.post.cleanMethod,
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //     )),
                      // SizedBox(height: 5.0),
                      // Text(
                      //     "Washing machine: " +
                      //         widget.post.waterTemperature +
                      //         widget.post.weight,
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //     )),
                      // SizedBox(height: 15.0),
                      // Text("Current status: " + widget.post.orderStatus,
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //     )),
                      // SizedBox(height: 5.0),
                      // Text("Status time: " + widget.post.statusTime,
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //     )),
                      // SizedBox(height: 15.0),

                      SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ));
  }
}
