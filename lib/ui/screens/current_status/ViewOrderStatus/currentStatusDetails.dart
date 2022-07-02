import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/current_status/current_status_screen.dart';
import 'package:superlaundry/ui/screens/current_status/current_status_viewmodel.dart';

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
                                "YOUR ORDER ACTIVITY",
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
                                    if (currentStep != 3) {
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
                                      title: Text('Order Status'),
                                      content: Column(
                                        children: [
                                          if (widget.post.orderStatus ==
                                              "ACCEPTED") ...[
                                            const Icon(
                                              Icons.book_online,
                                              size: 50,
                                              color: Colors.black,
                                            ),
                                            Text(
                                                "Your Order Received...Please Wait!",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ] else if (widget.post.orderStatus ==
                                              "REJECTED") ...[
                                            const Icon(
                                              Icons.book_online,
                                              size: 50,
                                              color: Colors.red,
                                            ),
                                            Text("Your Order Rejected",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black))
                                          ] else if (widget.post.orderStatus !=
                                                  "REJECTED" &&
                                              widget.post.orderStatus !=
                                                  "ACCEPTED") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            ),
                                            Text("Your Order In Progress...",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black))
                                          ] else ...[
                                            const Icon(Icons.cabin,
                                                size: 50, color: Colors.red),
                                            Text("Error",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red))
                                          ],
                                        ],
                                      ),
                                    ),
                                    Step(
                                      isActive: currentStep >= 1,
                                      title: Text('Laundry Status'),
                                      content: Column(
                                        children: <Widget>[
                                          if (widget.post.orderStatus ==
                                              "FOLDING") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            )
                                          ] else if (widget.post.orderStatus ==
                                              "WASHING") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            )
                                          ] else if (widget.post.orderStatus ==
                                              "DRYING") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            )
                                          ] else if (widget.post.orderStatus ==
                                              "READY FOR PICK UP") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            )
                                          ] else if (widget.post.orderStatus ==
                                              "READY FOR DELIVERY") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            )
                                          ] else if (widget.post.orderStatus ==
                                              "REJECTED") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.red,
                                            )
                                          ] else if (widget.post.orderStatus ==
                                                  "PICKED UP" ||
                                              widget.post.orderStatus ==
                                                  "DELIVERED") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            ),
                                            Text("Your Laundry On The Way!")
                                          ] else ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.black,
                                            ),
                                            Text(
                                                "Laundry In Process...Please Wait")
                                          ],
                                          Text(
                                            "CURRENT STATUS: " +
                                                widget.post.orderStatus,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 4, 107, 81),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Step(
                                      isActive: currentStep >= 2,
                                      title: Text('Delivery Status'),
                                      content: Column(
                                        children: [
                                          if (widget.post.orderStatus == "PICKED UP" ||
                                              widget.post.orderStatus ==
                                                  "DELIVERED") ...[
                                            const Icon(
                                              Icons.drive_eta,
                                              size: 50,
                                              color: Colors.black,
                                            ),
                                            Text("On It's Way!"),
                                          ] else if (widget.post.orderStatus !=
                                                  "DELIVERED" &&
                                              widget.post.orderStatus !=
                                                  "PICKED UP" &&
                                              widget.post.orderStatus !=
                                                  "REJECTED") ...[
                                            const Icon(
                                              Icons.car_crash,
                                              size: 50,
                                              color: Colors.red,
                                            ),
                                            Text("Laundry In Progress")
                                          ] else if (widget.post.orderStatus ==
                                              "REJECTED") ...[
                                            const Icon(
                                              Icons.car_crash,
                                              size: 50,
                                              color: Colors.red,
                                            ),
                                          ] else ...[
                                            const Icon(
                                              Icons.car_crash,
                                              size: 50,
                                              color: Colors.black,
                                            ),
                                          ],
                                          Text(
                                            "CURRENT STATUS: " +
                                                widget.post.orderStatus,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 4, 107, 81),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Step(
                                      isActive: currentStep >= 3,
                                      title: Text('Completed'),
                                      content: Column(
                                        children: [
                                          if (widget.post.orderStatus ==
                                              "COMPLETED") ...[
                                            const Icon(
                                              Icons.cable,
                                              size: 50,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              " YOUR ORDER STATUS HAS COMPLETED ",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 4, 107, 81),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ] else if (widget.post.orderStatus ==
                                              "INCOMPLETE") ...[
                                            const Icon(Icons.cable,
                                                size: 50, color: Colors.red),
                                            Text(
                                              " YOUR ORDER STATUS IS INCOMPLETE! ",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ] else if (widget.post.orderStatus ==
                                              "REJECTED") ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              "YOUR ORDER IS REJECTED! ",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ] else ...[
                                            const Icon(
                                              Icons.cabin,
                                              size: 50,
                                              color: Colors.red,
                                            ),
                                            Text("ORDER IN PROGRESS...WAITING",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ],
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
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "+ Laundry Service: " +
                                        widget.post.cleanMethod +
                                        " ",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "+ Delivery Service: " +
                                        widget.post.deliveryMethod +
                                        " ",
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
                                    "Payment: " + widget.post.paymentMethod,
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
                                    "Total Price: RM" +
                                        widget.post.totalPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ]))
              ]),
            ));
  }
}
