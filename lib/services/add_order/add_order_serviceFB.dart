import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';
import 'package:superlaundry/services/add_order/add_order_service.dart';
import '../../models/orders.dart';

class AddOrderServiceWithFireBase extends AddOrderService {
  final _auth = FirebaseAuth.instance;

  @override
  Future getWashingMachinePrice(String weight, String waterTemperature) async {
    if (weight == '9' && waterTemperature == 'Cold') {
      double washingMachinePrice = 4.5;
      return washingMachinePrice;
    } else if (weight == '14' && waterTemperature == 'Cold') {
      double washingMachinePrice = 6.0;
      return washingMachinePrice;
    } else if (weight == '25' && waterTemperature == 'Cold') {
      double washingMachinePrice = 10.0;
      return washingMachinePrice;
    } else if (weight == '9' && waterTemperature == 'Warm') {
      double washingMachinePrice = 5.5;
      return washingMachinePrice;
    } else if (weight == '14' && waterTemperature == 'Warm') {
      double washingMachinePrice = 7.0;
      return washingMachinePrice;
    } else if (weight == '25' && waterTemperature == 'Warm') {
      double washingMachinePrice = 12.0;
      return washingMachinePrice;
    } else if (weight == '9' && waterTemperature == 'Hot') {
      double washingMachinePrice = 6.5;
      return washingMachinePrice;
    } else if (weight == '14' && waterTemperature == 'Hot') {
      double washingMachinePrice = 8.0;
      return washingMachinePrice;
    } else if (weight == '25' && waterTemperature == 'Hot') {
      double washingMachinePrice = 14.0;
      return washingMachinePrice;
    }
  }

  @override
  Future calcTotalPrice(double deliveryMethodPrice, double cleanMethodPrice,
      String weight, String waterTemperature) async {
    double washingMachinePrice = 0.0;

    if (weight == '9' && waterTemperature == 'Cold') {
      washingMachinePrice = 4.5;
    } else if (weight == '14' && waterTemperature == 'Cold') {
      washingMachinePrice = 6.0;
    } else if (weight == '25' && waterTemperature == 'Cold') {
      washingMachinePrice = 10.0;
    } else if (weight == '9' && waterTemperature == 'Warm') {
      washingMachinePrice = 5.5;
    } else if (weight == '14' && waterTemperature == 'Warm') {
      washingMachinePrice = 7.0;
    } else if (weight == '25' && waterTemperature == 'Warm') {
      washingMachinePrice = 12.0;
    } else if (weight == '9' && waterTemperature == 'Hot') {
      washingMachinePrice = 6.5;
    } else if (weight == '14' && waterTemperature == 'Hot') {
      washingMachinePrice = 8.0;
    } else if (weight == '25' && waterTemperature == 'Hot') {
      washingMachinePrice = 14.0;
    }

    double totalPrice =
        deliveryMethodPrice + cleanMethodPrice + washingMachinePrice;
    return totalPrice;
  }

  @override
  Future createOrder(
      String deliveryMethod,
      String date,
      String time,
      String cleanMethod,
      String weight,
      String waterTemperature,
      String address,
      double totalPrice) async {
    // await postDetailsToFirestore(deliveryMethod, date, time, cleanMethod,
    //     weight, waterTemperature, address, totalPrice);

    try {
      final docOrders = FirebaseFirestore.instance.collection('orders').doc();
      final ordersModel = OrdersModel(
        orderId: docOrders.id,
        deliveryMethod: deliveryMethod,
        date: date,
        time: time,
        cleanMethod: cleanMethod,
        weight: weight,
        waterTemperature: waterTemperature,
        address: address,
        totalPrice: totalPrice,
      );

      final map = ordersModel.toJson();
      await docOrders.set(map);
      return 200;
    } on Exception catch (e) {
      return 101;
    }
  }

  // postDetailsToFirestore(
  //     String deliveryMethod,
  //     String date,
  //     String time,
  //     String cleanMethod,
  //     String weight,
  //     String waterTemperature,
  //     String address,
  //     double totalPrice) async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //   OrdersModel ordersModel = OrdersModel();

  //   ordersModel.deliveryMethod = deliveryMethod;
  //   ordersModel.date = date;
  //   ordersModel.time = time;
  //   ordersModel.cleanMethod = cleanMethod;
  //   ordersModel.weight = weight;
  //   ordersModel.waterTemperature = waterTemperature;
  //   ordersModel.address = address;
  //   ordersModel.totalPrice = totalPrice;

  //   await firebaseFirestore.collection('orders').doc().set(ordersModel.toMap());
  // }

  Stream<List<CleanMethodModel>> readCleanMethods() =>
      FirebaseFirestore.instance.collection('cleanmethods').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => CleanMethodModel.fromJson(doc.data()))
              .toList());
}