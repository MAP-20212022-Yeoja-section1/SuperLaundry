import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/orders.dart';
import '../../models/cleanMethodModel.dart';

abstract class AddOrderService {
  // final String? uid;
  // AddOrderService({this.uid});
  // final _auth = FirebaseAuth.instance;
  // final CollectionReference _userCollection =
  //     FirebaseFirestore.instance.collection('users');

  Future createOrder(
      String deliveryMethod,
      String date,
      String time,
      String cleanMethod,
      String weight,
      String waterTemperature,
      String address,
      double totalPrice);

  Future calcTotalPrice(double deliveryMethodPrice, double cleanMethodPrice,
      String weight, String waterTemperature);

  Future getWashingMachinePrice(String weight, String waterTemperature);

  // Future<Map> getAddress() async {
  //   final uid = await _auth.getCurrentUID();
  //   var users;
  //   var res = await _userCollection.doc(uid).get().then((ds) {
  //     users = {'address': ds['homeaddress']};
  //     return users;
  //   });
  //   return res;
  // }

  Stream<List<CleanMethodModel>> readCleanMethods();
}
