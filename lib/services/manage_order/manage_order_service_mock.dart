import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/models/user.dart';
import 'package:superlaundry/services/manage_order/manage_order_service.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/app/service_locator.dart';
import 'manage_order_service.dart';

class ManageOrderServiceMock extends ManageOrderService {
  // final LoginService _auth = locator<LoginService>();
  // final CollectionReference _users =
  //     FirebaseFirestore.instance.collection('users');

  @override
  Stream<List<OrdersModel>> readAllOrders() {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // final User? user = auth.currentUser;
    // final uid = user!.uid;

    return FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', isEqualTo: "SENT")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrdersModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future acceptOrder(String orderId) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final uid = user!.uid;
      final docOrder =
          FirebaseFirestore.instance.collection("orders").doc(orderId);

      await docOrder.update({
        'orderStatus': "ACCEPTED",
        'acceptedDelivery': false,
        'orderCompletion': 'INCOMPLETE'
      });
    } on Exception catch (e) {
      return 100;
    }
  }

  @override
  Future rejectOrder(String orderId) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final uid = user!.uid;
      final docOrder =
          FirebaseFirestore.instance.collection("orders").doc(orderId);

      await docOrder
          .update({'orderStatus': "REJECTED", 'acceptedDelivery': false});
    } on Exception catch (e) {
      return 100;
    }
  }

  @override
  Future<String> getCustomerName(String userId) async {
    String name;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      Map data = value.data() as Map;
      name = data['name'].toString();
      return name;
    });
  }

  @override
  Future<String> getCustomerPhoneNum(String userId) async {
    String pnum;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      Map data = value.data() as Map;
      pnum = data['phonenum'].toString();
      return pnum;
    });
  }
// @override
//  Future<Map> readCustomerDetails() async {
//     final uid = await _auth.getCurrentUID();
//     var users;
//     var data = await _users.doc(uid).get().then((value) {
//       users = {
//         'userId': value['userId'],
//         'name': value['name'],
//         'email': value['email'],
//         'phonenum': value['phonenum'],
//         'homeaddress': value['homeaddress'],
//       };
//       return users;
//     });
//     return data;
//   }

}
