import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/services/change_status/change_status_service.dart';
import '../../models/orders.dart';
import '../../../app/failures.dart';

class ChangeStatusServiceWithFireBase extends ChangeStatusService {
  Stream<List<OrdersModel>> readActiveOrders() => FirebaseFirestore.instance
      .collection('orders')
      .where('orderStatus', isNotEqualTo: 'COMPLETED')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => OrdersModel.fromJson(doc.data()))
          .toList());

  @override
  Future updateStatus(
      String orderStatus, String statusTime, String orderId) async {
    try {
      final docOrder =
          FirebaseFirestore.instance.collection("orders").doc(orderId);

      await docOrder
          .update({'orderStatus': orderStatus, 'statusTime': statusTime});
    } on Exception catch (e) {
      // return 100;
    }
  }
}
