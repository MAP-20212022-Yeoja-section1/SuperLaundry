// ignore_for_file: unused_catch_clause

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/orders.dart';
import 'deliOrder_service.dart';

class DeliOrderServiceMock extends DeliOrderService {
  @override
  Stream<List<OrdersModel>> readDeliOrder() {
    return FirebaseFirestore.instance
        .collection('orders')
        .where('acceptedDelivery', isEqualTo: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrdersModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future updateDelivery(String orderId) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    try {
      final docOrder =
          FirebaseFirestore.instance.collection("orders").doc(orderId);

      await docOrder.update({'deliveryId': uid, 'acceptedDelivery': true});
    } on Exception catch (e) {
      return 100;
    }
  }

  @override
  Future<String> getCustName(String userId) async {
    String custName;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      Map data = value.data() as Map;
      custName = data['name'].toString();
      return custName;
    });
  }

  @override
  Future<String> getCustPNo(String userId) async {
    String custPNo;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      Map data = value.data() as Map;
      custPNo = data['phonenum'].toString();
      return custPNo;
    });
  }
}
