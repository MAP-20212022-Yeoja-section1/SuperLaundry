// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/deliveryOrder/delivery_order_screen.dart';
import 'delivery_order_viewmodel.dart';

class DeliveryOrderDetails extends StatefulWidget{

  final OrdersModel post;

  DeliveryOrderDetails({required this.post});

  @override
  DeliveryOrderDetailsState createState() => DeliveryOrderDetailsState();

}

class DeliveryOrderDetailsState extends State<DeliveryOrderDetails>{

    @override   
    Widget build(BuildContext context){
      return View<DeliveryOrderViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
        appBar: AppBar(
        title: const Text('DELIVERY ORDER'),
        leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AcceptedDeliveryOrderScreen()));
        },
        icon: const Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 215, 169),
        foregroundColor: Colors.white,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 167, 255, 235)),
            ),
            SingleChildScrollView(
            child: Column(
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                          shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30), 
                                borderSide: const BorderSide(color: Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child:Center(
                                      child:Text("Order ID: "+
                                            widget.post.orderId,
                                            style: const TextStyle(fontSize: 18, color:Color.fromARGB(255, 4, 107, 81), fontWeight: FontWeight.bold), 
                                        ),  
                                    ),
                                  ),
                                  const Divider(color:  Color.fromARGB(255, 135, 135, 135),thickness: 1),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Order Date: "+
                                              widget.post.date,
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Order Time: "+
                                              widget.post.time,
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Padding(
                                      padding: EdgeInsets.all(15),
                                      child:Text("Customer Name: waiting",
                                              style: TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Address: "+
                                              widget.post.address,
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Padding(
                                      padding: EdgeInsets.all(15),
                                      child:Text("Phone Number: waiting",
                                              style: TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Cleaning Method: "+
                                              widget.post.cleanMethod,
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Weight: "+
                                              widget.post.weight + " kg",
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Water Temperature: "+
                                              widget.post.waterTemperature,
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Total Price: RM "+
                                              widget.post.totalPrice.toStringAsFixed(2),
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Payment Method: "+
                                              widget.post.paymentMethod,
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child:Text("Delivery Method: "+
                                              widget.post.deliveryMethod,
                                              style: const TextStyle(fontSize: 16), 
                                          ),  
                                      ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child:Text("Order Status: "+
                                            widget.post.orderStatus,
                                            style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 4, 107, 81), fontWeight: FontWeight.w600), 
                                        ),  
                                    ),
                                ]
                               )  
                          )
                      ),
                    ),
                ],
              ),
          ),
          ]
        ),
        )
      );
    }
}