import 'add_order.dart';

class OrderPaymentScreen extends StatefulWidget {
  String deliveryMethod;
  double deliveryMethodPrice;
  String cleanMethod;
  double cleanMethodPrice;
  String weight;
  String waterTemperature;
  double washingMachinePrice;
  double totalPrice;
  String date;
  String time;
  String address;

  OrderPaymentScreen(
      {required this.date,
      required this.time,
      required this.address,
      required this.deliveryMethod,
      required this.deliveryMethodPrice,
      required this.cleanMethod,
      required this.cleanMethodPrice,
      required this.weight,
      required this.waterTemperature,
      required this.washingMachinePrice,
      required this.totalPrice});

  @override
  _orderPaymentScreenState createState() => _orderPaymentScreenState(
      date,
      time,
      address,
      deliveryMethod,
      deliveryMethodPrice,
      cleanMethod,
      cleanMethodPrice,
      weight,
      waterTemperature,
      washingMachinePrice,
      totalPrice);
  // static Route route() =>
  //     MaterialPageRoute(builder: (_) => OrderPaymentScreen());
  // const OrderPaymentScreen({Key? key, @required this.deliveryMethod})
  //     : super(key: key);

  // PaymentMethod? paymentMethod;
}

class _orderPaymentScreenState extends State<OrderPaymentScreen> {
  bool visible = false;
  String deliveryMethod;
  double deliveryMethodPrice;
  String cleanMethod;
  double cleanMethodPrice;
  String weight;
  String waterTemperature;
  double washingMachinePrice;
  double totalPrice;
  String date;
  String time;
  String address;
  // PaymentMethod? paymentMethod;
  String orderStatus = "SENT";
  String statusTime = DateTime.now().toString();
  String paymentMethod = "";

  _orderPaymentScreenState(
      this.date,
      this.time,
      this.address,
      this.deliveryMethod,
      this.deliveryMethodPrice,
      this.cleanMethod,
      this.cleanMethodPrice,
      this.weight,
      this.waterTemperature,
      this.washingMachinePrice,
      this.totalPrice);

  // @override
  // void initState() {
  //   super.initState();
  //   OrderPaymentService.init();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const OrderPaymentAppBar(),
        body: View<AddOrderViewmodel>(
            shouldRebuild: false,
            builder: (_, viewmodel) => Stack(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Order Summary',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          'Delivery method = $deliveryMethod (RM $deliveryMethodPrice)',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Clean method = $cleanMethod (RM $cleanMethodPrice)',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Washing machine = $weight kg [$waterTemperature] (RM $washingMachinePrice)',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 13.0),
                        Text(
                          'Total price = RM $totalPrice',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 180.0),
                    child: GridView.count(crossAxisCount: 2, children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: InkWell(
                            onTap: () async {
                              paymentMethod = "Cash";
                              await viewmodel.createOrder(
                                  deliveryMethod: deliveryMethod,
                                  date: date,
                                  time: time,
                                  cleanMethod: cleanMethod,
                                  weight: weight,
                                  waterTemperature: waterTemperature,
                                  address: address,
                                  totalPrice: totalPrice,
                                  orderStatus: orderStatus,
                                  statusTime: statusTime,
                                  paymentMethod: paymentMethod);
                              userSubmit();
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/income.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(height: 20.0),
                                Text("Cash",
                                    style: new TextStyle(fontSize: 13.0))
                              ],
                            ))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: InkWell(
                            onTap: () async {
                              paymentMethod = "Debit/Credit Card";
                              var msg = await viewmodel.createOrder(
                                  deliveryMethod: deliveryMethod,
                                  date: date,
                                  time: time,
                                  cleanMethod: cleanMethod,
                                  weight: weight,
                                  waterTemperature: waterTemperature,
                                  address: address,
                                  totalPrice: totalPrice,
                                  orderStatus: orderStatus,
                                  statusTime: statusTime,
                                  paymentMethod: paymentMethod);
                              userSubmit();
                              // paymentMethod = await OrderPaymentService()
                              //     .createPaymentMethod();
                              // print(paymentMethod!.id);
                              if (msg == 101) {
                                Fluttertoast.showToast(
                                  msg:
                                      "Error occured, please fill in the order form again.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  fontSize: 16,
                                  backgroundColor:
                                      Color.fromARGB(255, 209, 68, 58),
                                );
                              }
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/credit-card.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(height: 20.0),
                                Text("Cash/Debit card",
                                    style: new TextStyle(fontSize: 13.0),
                                    textAlign: TextAlign.center)
                              ],
                            ))),
                      ),
                    ]),
                  ),
                ])),
      ),
    );
  }

  void userSubmit() async {
    setState(() {
      visible = true;
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Order submitted! '),
            actions: <Widget>[
              TextButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => mainMenuScreen()));
                },
              ),
            ],
          );
        });
  }
}
