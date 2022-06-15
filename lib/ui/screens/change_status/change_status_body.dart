import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/change_status/update_status_body.dart';
import '../../screens/change_status/change_status_viewmodel.dart';
import 'package:intl/intl.dart';

class ChangeStatusBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => ChangeStatusBody());

  @override
  _ChangeStatusBody createState() => _ChangeStatusBody();
}

class _ChangeStatusBody extends State<ChangeStatusBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return View<ChangeStatusViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                child: Center(
                  child: Text(
                    "Active orders",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 162, 126),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            StreamBuilder<List<OrdersModel>>(
                stream: viewmodel.readActiveOrders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final activeOrders = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: activeOrders.map(buildActiveOrders).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.red[700]),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget buildActiveOrders(OrdersModel om) => Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: Colors.white)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          title: Text(
            'Order ID: ' + om.orderId,
            style: TextStyle(fontSize: 17),
          ),
          subtitle: Text(om.date + " | " + om.orderStatus),
          trailing: const Icon(
            Icons.chevron_right_rounded,
            size: 32,
            color: Color.fromARGB(255, 17, 162, 126),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ActiveOrdersDetails(post: om))),
        ),
      ));
}
