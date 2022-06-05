import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';
import 'package:superlaundry/ui/screens/add_order/order_payment_screen.dart';
import '../../screens/add_order/add_order_viewmodel.dart';
import 'package:intl/intl.dart';

class AddOrderBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => AddOrderBody());

  @override
  _AddOrderBody createState() => _AddOrderBody();
}

class _AddOrderBody extends State<AddOrderBody> {
  final _formKey = GlobalKey<FormState>();
  var msg = 101;

  var deliveryMethodController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var cleanMethodController = TextEditingController();
  var weightController = TextEditingController();
  var waterTemperatureController = TextEditingController();
  var addressController = TextEditingController();
  String weight = '';
  String waterTemperature = '';
  bool? valuefirst = false;
  String deliveryMethod = "";
  String cleanMethod = "";
  String address = "";
  String date = "";
  String time = "";
  double deliveryMethodPrice = 0.0;
  double cleanMethodPrice = 0.0;
  double washingMachinePrice = 0.0;
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return View<AddOrderViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Stack(children: <Widget>[
              // StreamBuilder<List<CleanMethodModel>>(
              //   stream: viewmodel.readCleanMethods(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       return Text('Something went wrong!');
              //     } else if (snapshot.hasData) {
              //       final cleanMethodModel = snapshot.data!;

              //       return ListView(
              //         scrollDirection: Axis.horizontal,
              //         children: cleanMethodModel.map(buildCleanMethod).toList(),
              //       );
              //     } else {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //   },
              // ),
              Container(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 1.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: new EdgeInsets.only(top: 20.0, left: 90.0),
                        child: Column(
                          children: [
                            new Row(
                              children: <Widget>[
                                new Radio(
                                  value: 'Pickup',
                                  groupValue: deliveryMethod,
                                  onChanged: (val) {
                                    deliveryMethod = val.toString();
                                    setState(() {
                                      deliveryMethodPrice = 4;
                                      deliveryMethodController =
                                          new TextEditingController(
                                              text: deliveryMethod);
                                      // deliveryMethod =
                                      //     deliveryMethodController.text;
                                    });
                                  },
                                ),
                                Text(
                                  'Pickup',
                                  style: TextStyle(fontSize: 13),
                                ),
                                new Radio(
                                  value: 'Both',
                                  groupValue: deliveryMethod,
                                  onChanged: (val) {
                                    deliveryMethod = val.toString();
                                    setState(() {
                                      deliveryMethodPrice = 8;
                                      deliveryMethodController =
                                          new TextEditingController(
                                              text: deliveryMethod);
                                    });
                                  },
                                ),
                                Text(
                                  'Both',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date & time',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            // Text(
                            //   DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            // ),
                            _buildTextFormField(
                                dateController, context, 'Date', "YYYY/MM/DD"),
                            _buildTextFormField(
                                timeController, context, 'Time', "HH:MM"),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Clean method',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    new Radio(
                                      value: 'Wash only',
                                      groupValue: cleanMethod,
                                      onChanged: (val) {
                                        cleanMethod = val.toString();
                                        setState(() {
                                          cleanMethodPrice = 5;
                                          cleanMethodController =
                                              new TextEditingController(
                                                  text: cleanMethod);
                                          // cleanMethod =
                                          //     cleanMethodController.text;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Wash only',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    new Radio(
                                      value: 'Wash & dry',
                                      groupValue: cleanMethod,
                                      onChanged: (val) {
                                        cleanMethod = val.toString();
                                        setState(() {
                                          cleanMethodPrice = 8;
                                          cleanMethodController =
                                              new TextEditingController(
                                                  text: cleanMethod);
                                        });
                                      },
                                    ),
                                    Text(
                                      'Wash & dry',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    new Radio(
                                      value: 'Wash, dry & fold',
                                      groupValue: cleanMethod,
                                      onChanged: (val) {
                                        cleanMethod = val.toString();
                                        setState(() {
                                          cleanMethodPrice = 15;
                                          cleanMethodController =
                                              new TextEditingController(
                                                  text: cleanMethod);
                                        });
                                      },
                                    ),
                                    Text(
                                      'Wash, dry & fold',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Washing machine',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 18.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      'Approximate weight',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  new Row(
                                    children: <Widget>[
                                      new Radio(
                                        value: '9',
                                        groupValue: weight,
                                        onChanged: (val) {
                                          weight = val.toString();
                                          setState(() {
                                            weightController =
                                                new TextEditingController(
                                                    text: weight);
                                            // weight = weightController.text;
                                          });
                                        },
                                      ),
                                      Text(
                                        '9kg',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      new Radio(
                                        value: '14',
                                        groupValue: weight,
                                        onChanged: (val) {
                                          weight = val.toString();
                                          setState(() {
                                            weightController =
                                                new TextEditingController(
                                                    text: weight);
                                          });
                                        },
                                      ),
                                      Text(
                                        '14kg',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      new Radio(
                                        value: '25',
                                        groupValue: weight,
                                        onChanged: (val) {
                                          weight = val.toString();
                                          setState(() {
                                            weightController =
                                                new TextEditingController(
                                                    text: weight);
                                          });
                                        },
                                      ),
                                      Text(
                                        '25kg',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 0.0, left: 18.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      'Water temperature',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                new Radio(
                                  value: 'Cold',
                                  groupValue: waterTemperature,
                                  onChanged: (val) {
                                    waterTemperature = val.toString();
                                    setState(() {
                                      waterTemperatureController =
                                          new TextEditingController(
                                              text: waterTemperature);
                                      // waterTemperature =
                                      //     waterTemperatureController.text;
                                    });
                                  },
                                ),
                                Text(
                                  'Cold',
                                  style: TextStyle(fontSize: 13),
                                ),
                                new Radio(
                                  value: 'Warm',
                                  groupValue: waterTemperature,
                                  onChanged: (val) {
                                    waterTemperature = val.toString();
                                    setState(() {
                                      waterTemperatureController =
                                          new TextEditingController(
                                              text: waterTemperature);
                                    });
                                  },
                                ),
                                Text(
                                  'Warm',
                                  style: TextStyle(fontSize: 13),
                                ),
                                new Radio(
                                  value: 'Hot',
                                  groupValue: waterTemperature,
                                  onChanged: (val) {
                                    waterTemperature = val.toString();
                                    setState(() {
                                      waterTemperatureController =
                                          new TextEditingController(
                                              text: waterTemperature);
                                    });
                                  },
                                ),
                                Text(
                                  'Hot',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            Text(
                              'Current location',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    checkColor: Colors.white,
                                    activeColor:
                                        Color.fromARGB(255, 31, 215, 169),
                                    value: this.valuefirst,
                                    onChanged: (bool? value) async {
                                      this.valuefirst = true;
                                      if (value == true) {
                                        addressController.text = await viewmodel
                                            .getAddress()
                                            .toString();
                                      }
                                      setState(() {});
                                    }),
                                Text(
                                  'Default address',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            Container(
                              // padding: new EdgeInsets.all(10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.only(top: 5.0),
                                  ),
                                  new TextFormField(
                                    controller: addressController,
                                    decoration: const InputDecoration(
                                        labelText: 'New address'),
                                    // onSaved: (value) {
                                    //   address = addressController.text;
                                    // },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        220, 10, 20, 10),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () async {
                                        // _sendDataToPaymentScreen(context);
                                        washingMachinePrice = await viewmodel
                                            .getWashingMachinePrice(
                                                weight: weight,
                                                waterTemperature:
                                                    waterTemperature);
                                        totalPrice =
                                            await viewmodel.calcTotalPrice(
                                                deliveryMethodPrice:
                                                    deliveryMethodPrice,
                                                cleanMethodPrice:
                                                    cleanMethodPrice,
                                                weight: weightController.text,
                                                waterTemperature:
                                                    waterTemperatureController
                                                        .text);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderPaymentScreen(
                                                        date:
                                                            dateController.text,
                                                        time:
                                                            timeController.text,
                                                        address:
                                                            addressController
                                                                .text,
                                                        deliveryMethod:
                                                            deliveryMethod,
                                                        deliveryMethodPrice:
                                                            deliveryMethodPrice,
                                                        cleanMethod:
                                                            cleanMethod,
                                                        cleanMethodPrice:
                                                            cleanMethodPrice,
                                                        weight: weight,
                                                        waterTemperature:
                                                            waterTemperature,
                                                        washingMachinePrice:
                                                            washingMachinePrice,
                                                        totalPrice:
                                                            totalPrice)));
                                      },
                                      child: Text('Next'),
                                      textColor: Colors.white,
                                      color: Color.fromARGB(255, 31, 215, 169),
                                      focusColor:
                                          Color.fromARGB(255, 31, 215, 169),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]));
  }

  Padding _buildTextFormField(TextEditingController controller,
      BuildContext context, String labelText, String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            keyboardType: TextInputType.datetime,
          ),
        ),
      ]),
    );
  }

  Widget buildCleanMethod(CleanMethodModel cleanMethodModel) => Row(
        children: <Widget>[
          Radio(
            value: cleanMethodModel.cmName,
            groupValue: cleanMethod,
            onChanged: (val) {
              cleanMethod = val.toString();
              setState(() {
                cleanMethodController =
                    new TextEditingController(text: cleanMethodModel.cmName);
                cleanMethodPrice = cleanMethodModel.cmPrice;
              });
            },
          ),
          Text(
            cleanMethodModel.cmName,
            style: TextStyle(fontSize: 13),
          ),
        ],
      );
}
