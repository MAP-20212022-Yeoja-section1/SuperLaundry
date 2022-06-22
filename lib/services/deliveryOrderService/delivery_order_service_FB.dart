import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/orders.dart';
import 'delivery_order_service.dart';

class DeliveryOrderManagementServiceFB extends DeliveryOrderManagementService{
  
  @override
  Stream<List<OrdersModel>> readAcceptedDeliveryOrder() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return FirebaseFirestore.instance
        .collection('orders')
        .where('deliveryId', isEqualTo: uid)
        .where('orderStatus', isNotEqualTo: "COMPLETED")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrdersModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future updateStatusDelivery(String orderId, String orderStatus) async {
     
     try{
      final docOrder = FirebaseFirestore.instance
      .collection("orders")
      .doc(orderId);

      await docOrder.update({
        'orderStatus' : orderStatus,
        'statusTime' : DateTime.now().toIso8601String(),
      });

    }on Exception catch (e){

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

  @override
  Future cancelDelivery(String orderId) async{
      
    try{

      final docOrder = FirebaseFirestore.instance
      .collection("orders")
      .doc(orderId);

      await docOrder.update({
        'acceptedDelivery': false,
        'deliveryId': FieldValue.delete(),
      });

    }on Exception catch (e){

      return 100;

    }
  }
}