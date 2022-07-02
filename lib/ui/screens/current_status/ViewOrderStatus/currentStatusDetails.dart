// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/current_status/current_status_screen.dart';
import 'package:superlaundry/ui/screens/current_status/current_status_viewmodel.dart';
// import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_screen.dart';

class CurrStatusDetails extends StatefulWidget {
  final OrdersModel post;
  CurrStatusDetails({required this.post});

  @override
  CurrStatusDetailsState createState() => CurrStatusDetailsState();
}

class CurrStatusDetailsState extends State<CurrStatusDetails> {
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return View<CurrStatusViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: Text('ORDER STATUS'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrStatusScreen()));
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
                  decoration: const BoxDecoration(color: Colors.white),
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
                            padding: const EdgeInsets.only(left: 10.0),
                            child: ListTile(
                              title: Text(
                                "ORDER STATUS",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                      Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 167, 255, 235))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                      primary: Colors.lightGreen),
                                ),
                                child: Stepper(
                                  currentStep: currentStep,
                                  onStepTapped: (index) {
                                    setState(() => currentStep = index);
                                  },
                                  onStepContinue: () {
                                    if (currentStep != 2) {
                                      setState(() => currentStep++);
                                    }
                                  },
                                  onStepCancel: () {
                                    if (currentStep != 0) {
                                      setState(() => currentStep--);
                                    }
                                  },
                                  steps: [
                                    Step(
                                      isActive: currentStep >= 0,
                                      title: Text('Your Order Satus'),
                                      content: Text(
                                        "STATUS: " + widget.post.orderStatus,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromARGB(255, 4, 107, 81),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Step(
                                      isActive: currentStep >= 1,
                                      title: Text('DeliverySatus'),
                                      content: Text(
                                        "STATUS: " + widget.post.orderStatus,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromARGB(255, 4, 107, 81),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Step(
                                      isActive: currentStep >= 2,
                                      title: Text('Completed'),
                                      content: Text(
                                        " YOUR ORDER STATUS HAS COMPLETED ",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromARGB(255, 4, 107, 81),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 167, 255, 235))),
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ListTile(
                                    title: Text(
                                      "ORDER SUMMARY",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Method: " + widget.post.cleanMethod + " ",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total Price: " +
                                        widget.post.totalPrice.toString() +
                                        " ",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            )),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10, bottom: 20),
                      //   child: FloatingActionButton.extended(
                      //     onPressed: () async {
                      //       dynamic msg = await viewmodel.updateDelivery(
                      //           orderId: widget.post.orderId);

                      //       if (msg == 100) {
                      //         Fluttertoast.showToast(
                      //           msg:
                      //               "Error! Unable to assigned the delivery order.",
                      //           toastLength: Toast.LENGTH_LONG,
                      //           gravity: ToastGravity.BOTTOM,
                      //           fontSize: 16,
                      //           backgroundColor:
                      //               const Color.fromARGB(255, 209, 68, 58),
                      //         );
                      //       } else {
                      //         Fluttertoast.showToast(
                      //           msg:
                      //               "The delivery status has been asigned successfully!",
                      //           toastLength: Toast.LENGTH_LONG,
                      //           gravity: ToastGravity.BOTTOM,
                      //           fontSize: 16,
                      //           backgroundColor:
                      //               const Color.fromARGB(255, 69, 161, 76),
                      //         );
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     deliGetOrderScreen()));
                      //       }
                      //     },
                      //     label: const Text('Accept Order',
                      //         // ignore: unnecessary_const
                      //         style: const TextStyle(
                      //             fontWeight: FontWeight.bold, fontSize: 18)),
                      //     highlightElevation: 10.0,
                      //     backgroundColor: Color.fromARGB(255, 4, 107, 81),
                      //   ),
                      // )
                    ]))
              ]),
            ));
  }
}
