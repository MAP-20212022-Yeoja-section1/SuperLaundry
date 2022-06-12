// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_screen.dart';
import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_viewmodel.dart';
// import '../viewCleanMethod/cleanser_viewmodel.dart';

class DeliOrderDetails extends StatefulWidget {
  final OrdersModel post;
  // final LoginService _auth = locator<LoginService>();
  DeliOrderDetails({required this.post});

  @override
  DeliOrderDetailsState createState() => DeliOrderDetailsState();
}

class DeliOrderDetailsState extends State<DeliOrderDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return View<deliOrderViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: Text('DELIVERY ORDER'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => deliGetOrderScreen()));
                  },
                  icon: Icon(Icons.chevron_left_sharp),
                  iconSize: 40.0,
                ),
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 31, 215, 169),
                foregroundColor: Colors.white,
              ),
              body: Stack(children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 167, 255, 235)),
                ),
                SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 167, 255, 235))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                // leading: Icon(Icons.label_important),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                        child: Text(
                                      "Order ID: " + widget.post.orderId + " ",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "ORDER DETAILS: ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 17, 162, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: FutureBuilder<String>(
                                      future: viewmodel
                                          .getCustName(widget.post.userId),
                                      builder:
                                          (BuildContext context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              "Customer Name: " +
                                                  snapshot.data.toString(),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          );
                                        } else {
                                          return Text('No data is found!');
                                        }
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
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
                                          .getCustPNo(widget.post.userId),
                                      builder:
                                          (BuildContext context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              "Phone Number: " +
                                                  snapshot.data.toString(),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          );
                                        } else {
                                          return Text('No data is found!');
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "Cleaning method: " +
                                            widget.post.cleanMethod +
                                            " ",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "Weight: " + widget.post.weight + " ",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "Water Temperature: " +
                                            widget.post.waterTemperature +
                                            " ",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "Total Price: " +
                                            widget.post.totalPrice.toString() +
                                            " ",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "Payment Method: " +
                                            widget.post.paymentMethod +
                                            " ",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "Delivery Method: " +
                                            widget.post.deliveryMethod +
                                            " ",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ListTile(
                                        title: Text(
                                      "STATUS: " + widget.post.orderStatus,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 4, 107, 81),
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ]),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            dynamic msg = await viewmodel.updateDelivery(
                                orderId: widget.post.orderId);

                            if (msg == 100) {
                              Fluttertoast.showToast(
                                msg:
                                    "Error! Unable to assigned the delivery order.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                fontSize: 16,
                                backgroundColor:
                                    const Color.fromARGB(255, 209, 68, 58),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg:
                                    "The delivery status has been asigned successfully!",
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
                                          deliGetOrderScreen()));
                            }
                          },
                          label: const Text('Accept Order',
                              // ignore: unnecessary_const
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          highlightElevation: 10.0,
                          backgroundColor: Color.fromARGB(255, 4, 107, 81),
                        ),
                      )
                    ]))
              ]),
            ));
  }
}
