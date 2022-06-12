import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_screen.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_viewmodel.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_screen.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_viewmodel.dart';
// import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_viewmodel.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ManageOrderDetailsBody extends StatefulWidget {
  final OrdersModel post;

  ManageOrderDetailsBody({required this.post});

  @override
  ManageOrderDetailsBodyState createState() => ManageOrderDetailsBodyState();
}

class ManageOrderDetailsBodyState extends State<ManageOrderDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return View<ManageOrderViewModel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: Text('MANAGE ORDER'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageOrderScreen()));
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
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(
                            "CUSTOMER DETAILS",
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
                            child: FutureBuilder<String>(
                              future:
                                  viewmodel.getCustomerName(widget.post.userId),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Text(
                                      "Name: " + snapshot.data.toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  );
                                } else {
                                  return const Text('No data is found!');
                                }
                              },
                            ),
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
                            child: FutureBuilder<String>(
                              future: viewmodel
                                  .getCustomerPhoneNum(widget.post.userId),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Text(
                                      "Phone Number: " +
                                          snapshot.data.toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  );
                                } else {
                                  return const Text('No data is found!');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
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
                            child: Text(
                                "Delivery method: " +
                                    widget.post.deliveryMethod,
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
                            child: Text("Weight: " + widget.post.weight + "kg",
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
                      SizedBox(height: 13.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 10, left: 90, bottom: 20),
                            child: FloatingActionButton.extended(
                              heroTag: "accept",
                              onPressed: () async {
                                dynamic msg = await viewmodel.acceptOrder(
                                    orderId: widget.post.orderId);

                                if (msg == 100) {
                                  Fluttertoast.showToast(
                                    msg: "Error! Unable to accept order.",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 209, 68, 58),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "The order is successfully accepted!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 69, 161, 76),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageOrderScreen()));
                                }
                              },
                              label: const Text('ACCEPT',
                                  // ignore: unnecessary_const
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              highlightElevation: 10.0,
                              backgroundColor:
                                  Color.fromARGB(255, 27, 231, 180),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 30, left: 10, bottom: 20),
                            child: FloatingActionButton.extended(
                              heroTag: "reject",
                              onPressed: () async {
                                dynamic msg = await viewmodel.rejectOrder(
                                    orderId: widget.post.orderId);

                                if (msg == 100) {
                                  Fluttertoast.showToast(
                                    msg: "Error! Unable to reject order.",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 209, 68, 58),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "The order is successfully rejected!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 69, 161, 76),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageOrderScreen()));
                                }
                              },
                              label: const Text('REJECT',
                                  // ignore: unnecessary_const
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              highlightElevation: 10.0,
                              backgroundColor:
                                  Color.fromARGB(255, 232, 103, 86),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
