import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/order.dart';
// import 'package:superlaundry/models/user.dart';
// import 'package:superlaundry/services/registration/login_service.dart';
// import 'package:superlaundry/app/service_locator.dart';

abstract class OrderHistoryService {
  Stream<List<OrderModel>> readOrderHistory();
  final String? uid;
  OrderHistoryService({this.uid});
  // Future<Map> getOrderDetails();
}

class OrderHistoryServiceMock extends OrderHistoryService {
  // get order history list
  @override
  Stream<List<OrderModel>> readOrderHistory() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return FirebaseFirestore.instance
        .collection('order')
        .where('userId', isEqualTo: uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList());
  }

  // Stream<List<OrderDetails>> readOrderDetails(){
  //    final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   final uid = user!.uid;
  //   final orderId = order!.uid;

  //   return FirebaseFirestore.instance
  //    .collection('users')
  //     .doc(uid)
  //     .collection('order')
  //     .doc(orderId)
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs.map((doc) => OrderDetails.fromJson(doc.data())).toList());
  // }
  // @override
  // Future<Map> getOrderDetails() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   final uid = user!.uid;

  //   var data;
  //   var res = await _userCollection.doc(uid).collection('order').get().then((value) {
  //     data = {
  //       'method': value['method'],
  //     };
  //     return data;
  //   });
  //   return res;
  // }

  //  Future<Map> getOrderDetails() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   final uid = user!.uid;

  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       print('Document data: ${documentSnapshot.data()}');
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }
}
