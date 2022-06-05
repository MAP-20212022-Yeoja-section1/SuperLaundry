import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';
import 'package:superlaundry/services/add_order/add_order_service.dart';
import '../../models/orders.dart';
import '../../../app/failures.dart';

class AddOrderServiceWithFireBase extends AddOrderService {
  final _auth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

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
  Future<Map> getAddress() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    var data;
    var res = await _userCollection.doc(uid).get().then((value) {
      data = {
        'address': value['homeaddress'].toString(),
      };
      print(data);
      return data;
    });
    return res;
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
      double totalPrice,
      String orderStatus,
      String statusTime) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final uid = user!.uid;

      final docOrders = FirebaseFirestore.instance.collection('orders').doc();
      final ordersModel = OrdersModel(
        userId: user.uid,
        orderId: docOrders.id,
        deliveryMethod: deliveryMethod,
        date: date,
        time: time,
        cleanMethod: cleanMethod,
        weight: weight,
        waterTemperature: waterTemperature,
        address: address,
        totalPrice: totalPrice,
        orderStatus: orderStatus,
        statusTime: statusTime,
      );

      final map = ordersModel.toJson();
      await docOrders.set(map);

      //insert order in the 'order' sub-collection inside 'users' collection if FS
      // await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(uid)
      //     .collection('order')
      //     .add(map);

      return Failures.submitOrderSucceed;
    } on Exception catch (e) {
      return Failures.submitFail;
    }
  }

  // @override
  // addOrderToUser(
  //     String? id,
  //     String deliveryMethod,
  //     String date,
  //     String time,
  //     String cleanMethod,
  //     String weight,
  //     String waterTemperature,
  //     String address,
  //     double totalPrice) async {
  //   _userCollection.doc(id).collection('order').add({
  //     'orderId': id,
  //     'deliveryMethod': deliveryMethod,
  //     'date': date,
  //     'time': time,
  //     'cleanMethod': cleanMethod,
  //     'weight': weight,
  //     'waterTemperature': waterTemperature,
  //     'address': address,
  //     'totalPrice': totalPrice
  //   });
  // }

  Stream<List<CleanMethodModel>> readCleanMethods() =>
      FirebaseFirestore.instance.collection('cleanmethods').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => CleanMethodModel.fromJson(doc.data()))
              .toList());
}
