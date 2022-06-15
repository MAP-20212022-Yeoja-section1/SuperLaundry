// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/deliveryOrder/delivery_order_screen.dart';
import 'delivery_order_viewmodel.dart';

class DeliveredOrder extends StatefulWidget {
  final OrdersModel post;

  DeliveredOrder({required this.post});

  @override
  DeliveredOrderState createState() => DeliveredOrderState();
}

class DeliveredOrderState extends State<DeliveredOrder> {
  @override
  Widget build(BuildContext context) {
    return View<DeliveryOrderViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: const Text('DELIVERY ORDER'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AcceptedDeliveryOrderScreen()));
                  },
                  icon: const Icon(Icons.chevron_left_sharp),
                  iconSize: 40.0,
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 31, 215, 169),
                foregroundColor: Colors.white,
              ),
              body: Stack(children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 167, 255, 235)),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  width: 0)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 31, 169, 134),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, top: 20),
                                    child: Text(
                                      "Order Details",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Order ID: " + widget.post.orderId,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Order Date: " + widget.post.date,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Order Time: " + widget.post.time,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: FutureBuilder<String>(
                                  future: viewmodel
                                      .getCustomerName(widget.post.userId),
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          "Customer Name: " +
                                              snapshot.data.toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      );
                                    } else {
                                      return const Text('No data is found!');
                                    }
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Address: " + widget.post.address,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: FutureBuilder<String>(
                                  future: viewmodel
                                      .getCustomerPhoneNum(widget.post.userId),
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          "Phone Number: " +
                                              snapshot.data.toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      );
                                    } else {
                                      return const Text('No data is found!');
                                    }
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Cleaning Method: " +
                                        widget.post.cleanMethod,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Weight: " + widget.post.weight + " kg",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Water Temperature: " +
                                        widget.post.waterTemperature,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Total Price: RM " +
                                        widget.post.totalPrice
                                            .toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Payment Method: " +
                                        widget.post.paymentMethod,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Delivery Method: " +
                                        widget.post.deliveryMethod,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Divider(
                                    thickness: 1,
                                    color: Color.fromARGB(255, 209, 206, 206),
                                  ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15))),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 15,
                                          top: 15,
                                          left: 10,
                                          right: 10),
                                      child: Center(
                                        child: Text(
                                          "Order Status: " +
                                              widget.post.orderStatus +
                                              "\n\nStatus Time: " +
                                              widget.post.statusTime,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(255, 24, 109, 88),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 20),
                                      child: FloatingActionButton.extended(
                                        heroTag: "btn1",
                                        onPressed: () async {
                                          dynamic msg = await viewmodel
                                              .updateStatusDelivery(
                                                  orderId: widget.post.orderId,
                                                  orderStatus: "DELIVERED");

                                          if (msg == 100) {
                                            Fluttertoast.showToast(
                                              msg:
                                                  "Error! Unable to update the delivery status.",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              fontSize: 16,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 209, 68, 58),
                                            );
                                          } else {
                                            Fluttertoast.showToast(
                                              msg:
                                                  "The delivery status is successfully updated!",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              fontSize: 16,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 69, 161, 76),
                                            );
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AcceptedDeliveryOrderScreen()));
                                          }
                                        },
                                        label: const Text('Delivered',
                                            // ignore: unnecessary_const
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                        backgroundColor: Color.fromARGB(255, 31, 169, 134),
                                        icon: Icon(Icons.done_sharp),
                                      ),
                                    ),
                                  ])),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:20, bottom:30),
                        child: FloatingActionButton.extended(
                          heroTag: "btn2",
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    title: Center(
                                        child: Text("Cancel Delivery",
                                            style:
                                                TextStyle(color: Colors.red))),
                                    content: Text(
                                      "Are you sure you want to cancel the delivery?",
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          child: Text("Yes"),
                                          onPressed: () async {
                                            dynamic msg =
                                                await viewmodel.cancelDelivery(
                                                    widget.post.orderId);
                                            if (msg == 100) {
                                              Fluttertoast.showToast(
                                                msg:
                                                    "Error! Unable to cancel the delivery.",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                fontSize: 16,
                                                backgroundColor: Color.fromARGB(
                                                    255, 209, 68, 58),
                                              );
                                            } else {
                                              Fluttertoast.showToast(
                                                msg:
                                                    "The delivery cancellation is successfully!",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                fontSize: 16,
                                                backgroundColor: Color.fromARGB(
                                                    255, 69, 161, 76),
                                              );
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AcceptedDeliveryOrderScreen()));
                                            }
                                          }),
                                      FlatButton(
                                          child: Text("No"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  );
                                });
                          },
                          label: Text('Cancel Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          highlightElevation: 10.0,
                          backgroundColor: Color.fromARGB(255, 255, 83, 83),
                          icon: Icon(Icons.cancel_sharp),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ));
  }
}
