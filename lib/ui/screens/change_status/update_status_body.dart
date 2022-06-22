import 'change_status.dart';

class ActiveOrdersDetails extends StatefulWidget {
  final OrdersModel post;

  ActiveOrdersDetails({required this.post});

  @override
  ActiveOrdersDetailsState createState() => ActiveOrdersDetailsState();
}

class ActiveOrdersDetailsState extends State<ActiveOrdersDetails> {
  final statusController = TextEditingController();
  List<String> items = [
    'WASHING',
    'DRYING',
    'FOLDING',
    'READY FOR PICK UP',
    'READY FOR DELIVERY',
    'COMPLETED'
  ];
  String? selectedStatus = 'SENT';

  @override
  Widget build(BuildContext context) {
    return View<ChangeStatusViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: Text('UPDATE STATUS'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeStatusScreen()));
                  },
                  icon: Icon(Icons.chevron_left_sharp),
                  iconSize: 40.0,
                ),
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 31, 215, 169),
                foregroundColor: Colors.white,
                actions: <Widget>[],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                      "Order ID: " + widget.post.orderId,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: ListTile(
                        title: Text(
                          "ORDER DETAILS",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
                    Text("Delivery method: " + widget.post.deliveryMethod,
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(height: 5.0),
                    Text("Clean method: " + widget.post.cleanMethod,
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(height: 5.0),
                    Text(
                        "Washing machine: " +
                            widget.post.waterTemperature +
                            widget.post.weight,
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(height: 15.0),
                    Text("Current status: " + widget.post.orderStatus,
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(height: 5.0),
                    Text("Status time: " + widget.post.statusTime,
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(height: 15.0),
                    Text(
                        "Total price: " +
                            widget.post.totalPrice.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(height: 5.0),
                    Text("Payment method: " + widget.post.paymentMethod,
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller: statusController,
                        decoration: InputDecoration(
                            labelText: "Update status",
                            suffixIcon: PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 40,
                              ),
                              onSelected: (String value) {
                                statusController.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return items
                                    .map<PopupMenuItem<String>>((String value) {
                                  return new PopupMenuItem(
                                      child: new Text(value), value: value);
                                }).toList();
                              },
                            )),
                        validator: (value) {
                          if (statusController.text == 'SENT' ||
                              statusController.text == 'WASHING' ||
                              statusController.text == 'DRYING' ||
                              statusController.text == 'FOLDING' ||
                              statusController.text == 'COMPLETED') {
                            return null;
                          }
                          return "Must be SENT, WASHING, DRYING, FOLDING, or COMPLETED only.";
                        },
                        onSaved: (value) {
                          statusController.text = value!;
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(240, 10, 10, 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () async {
                            dynamic msg = await viewmodel.updateStatus(
                                orderStatus: statusController.text,
                                statusTime: DateTime.now().toIso8601String(),
                                orderId: widget.post.orderId);

                            if (msg == 100) {
                              Fluttertoast.showToast(
                                msg:
                                    "Error! Unable to update the order status.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                fontSize: 16,
                                backgroundColor:
                                    const Color.fromARGB(255, 209, 68, 58),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg:
                                    "The order status is successfully updated!",
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
                                          ChangeStatusScreen()));
                            }
                          },
                          child: Text('Update'),
                          textColor: Colors.white,
                          color: Color.fromARGB(255, 31, 215, 169),
                          focusColor: Color.fromARGB(255, 31, 215, 169),
                        )),
                  ],
                ),
              ),
            ));
  }
}
