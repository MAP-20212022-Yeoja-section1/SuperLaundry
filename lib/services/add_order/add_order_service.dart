import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/orders.dart';
import '../../models/cleanMethodModel.dart';

abstract class AddOrderService {
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

  Future<Map> getAddress();

  Stream<List<CleanMethodModel>> readCleanMethods();
}
