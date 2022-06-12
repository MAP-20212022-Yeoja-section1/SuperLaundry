import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/orders.dart';

abstract class ChangeStatusService {
  Stream<List<OrdersModel>> readActiveOrders();
  Future updateStatus(String orderStatus, String statusTime, String orderId);
}
