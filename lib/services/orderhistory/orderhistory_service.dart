import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:superlaundry/models/order.dart';
import 'package:superlaundry/models/orders.dart';

abstract class OrderHistoryService {
  Stream<List<OrdersModel>> readOrderHistory();
  final String? uid;
  OrderHistoryService({this.uid});
  // Future<Map> getOrderDetails();
}
