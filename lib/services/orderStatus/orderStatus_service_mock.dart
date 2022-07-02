// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:superlaundry/services/profile_edit/profile_service.dart';
// import 'package:superlaundry/services/registration/login_service.dart';
// import 'package:superlaundry/app/service_locator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/orders.dart';
import 'orderStatus_service.dart';

class CurrStatusServiceMock extends CurrStatusService {
  @override
  Stream<List<OrdersModel>> readStatus() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrdersModel.fromJson(doc.data()))
            .toList());
  }

  // @override
  // Future<String> getStatus(String userId) async {
  //   String custStatus;
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .get()
  //       .then((value) {
  //     Map data = value.data() as Map;
  //     custStatus = data['name'].toString();
  //     return custStatus;
  //   });
  // }

  // @override
  // Stream<List<OrdersModel>> readDeliveryStatus() {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   // final uid = user!.uid;

  //   return FirebaseFirestore.instance
  //       .collection('orders')
  //       .where('orderCompletion', isNotEqualTo: 'REJECTED')
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) => OrdersModel.fromJson(doc.data()))
  //           .toList());
  // }

}
