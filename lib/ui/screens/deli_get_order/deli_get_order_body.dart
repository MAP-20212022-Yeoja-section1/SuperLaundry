// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_viewmodel.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/deli_get_order/viewOrderDetails.dart/deliOrderDetails.dart';
import 'deli_get_order_viewmodel.dart';

class deliGetOrderBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => deliGetOrderBody());

  @override
  _deliGetOrderBody createState() => _deliGetOrderBody();
}

class _deliGetOrderBody extends State<deliGetOrderBody> {
  @override
  Widget build(BuildContext Context) {
    return View<deliOrderViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                child: Center(
                  child: Text(
                    "PENDING DELIVERY ORDER",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 162, 126),
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ),
            StreamBuilder<List<OrdersModel>>(
                stream: viewmodel.readDeliOrder(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final deliorders = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: deliorders.map(buildDeliOrder).toList(),
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
            // Padding(
            //   padding: EdgeInsets.only(top: 50.0),
            //   child: FloatingActionButton.extended(
            //     onPressed: () {
            //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCleanMethod()));
            //     },
            //     label: Text(
            //       "Add clean method",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     backgroundColor: Color.fromARGB(255, 17, 162, 126),
            //     icon: Icon(Icons.add),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget buildDeliOrder(OrdersModel od) => Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: Colors.white)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          title: Text(
            od.orderId,
            style: TextStyle(fontSize: 18),
          ),
          trailing: const Icon(
            Icons.chevron_right_rounded,
            size: 32,
            color: Color.fromARGB(255, 17, 162, 126),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeliOrderDetails(post: od))),
        ),
      ));
}
