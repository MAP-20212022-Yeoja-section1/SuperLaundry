import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/services/change_status/change_status_service.dart';
import '../../models/orders.dart';

class ChangeStatusServiceWithFireBase extends ChangeStatusService {
  @override
  Stream<List<OrdersModel>> readActiveOrders() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return FirebaseFirestore.instance
        .collection('orders')
        .where('orderCompletion', isEqualTo: 'INCOMPLETE')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrdersModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future updateStatus(
      String orderStatus, String statusTime, String orderId) async {
    try {
      final docOrder =
          FirebaseFirestore.instance.collection("orders").doc(orderId);

      if (orderStatus == "COMPLETED") {
        await docOrder.update({
          'orderStatus': orderStatus, //constant reference
          'statusTime': statusTime,
          'orderCompletion': 'COMPLETED'
        });
      } else {
        await docOrder.update({
          'orderStatus': orderStatus,
          'statusTime': statusTime,
        });
      }
    } on Exception catch (e) {
      return 100;
    }
  }
}
