// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/ui/screens/deliveryOrder/delivered_order.dart';
import 'package:superlaundry/ui/screens/deliveryOrder/delivery_order_details.dart';
import 'package:superlaundry/ui/screens/deliveryOrder/picked_up_order.dart';
import 'delivery_order_viewmodel.dart';

class AcceptedDeliveryOrderBody extends StatefulWidget {

  static Route route() => MaterialPageRoute(builder: (_) => AcceptedDeliveryOrderBody());

  @override
  _AcceptedDeliveryOrderBody createState() => _AcceptedDeliveryOrderBody();
}

class _AcceptedDeliveryOrderBody extends State<AcceptedDeliveryOrderBody> {

  @override
  Widget build(BuildContext Context) {
    return View<DeliveryOrderViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) =>
        SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<OrdersModel>>(
                stream: viewmodel.readAcceptedDeliveryOrder(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    final acceptedDelOrders = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: acceptedDelOrders.map(buildAcceptedDelOrder).toList(),
                    );
                  }else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.red[700]
                          ),
                        ),
                      );
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
              }
              ),
            ],
          ),
        ),              
      );
  }

  Widget buildAcceptedDelOrder(OrdersModel dOrder) => Card(
    shape:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(3),
    borderSide: const BorderSide(color: Colors.white)
    ),
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: ListTile(
      title: Text(dOrder.orderStatus,
                style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 17, 162, 126)
                      ),),
      subtitle: Text("Order ID: "+ dOrder.orderId,
            style: const TextStyle(
            fontSize: 16,
            height: 2.5,
            ),
          ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 32,
        color: Color.fromARGB(255, 17, 162, 126),
        ),
        onTap: (){
        if(dOrder.orderStatus == "READY FOR DELIVERY")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveredOrder(post: dOrder)));
        }
        else if(dOrder.orderStatus == "READY FOR PICK UP"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PickedUpOrder(post: dOrder)));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryOrderDetails(post: dOrder)));
        }
      }
    ),
    )
  );
}