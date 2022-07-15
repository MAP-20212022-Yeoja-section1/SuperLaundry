import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/orders.dart';
import 'orderhistory_service.dart';

class OrderHistoryServiceMock extends OrderHistoryService {
  // get order history list
  @override
  Stream<List<OrdersModel>> readOrderHistory() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: uid)
        .where('orderStatus', isEqualTo: 'COMPLETED')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrdersModel.fromJson(doc.data()))
            .toList());
  }
}
