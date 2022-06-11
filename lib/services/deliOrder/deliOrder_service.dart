import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/models/user.dart';

class DeliOrderService {
  @override
  Stream<List<OrdersModel>> readDeliOrder() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return FirebaseFirestore.instance
        .collection('orders')
        .where('acceptedDelivery', isEqualTo: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrdersModel.fromJson(doc.data()))
            .toList());
  }

  // @override
  // Stream<List<UserModel>> readDeliUser() => FirebaseFirestore.instance
  //     .collection('users')
  //     .where('userId', isEqualTo: uid)
  //     // .where('orderStatus', isEqualTo: 'READY FOR PICK UP')
  //     .where('acceptedDelivery', isEqualTo: false)
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList());
}
