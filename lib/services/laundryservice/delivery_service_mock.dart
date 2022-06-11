import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/deliveryMethodModel.dart';
import 'delivery_service.dart';

class DeliveryManagementServiceMock extends DeliveryManagementService{

  @override
  Future addDeliveryMethod(String dmname, double price) async {

    try {
      final docDelivery = FirebaseFirestore.instance.collection("deliverymethods").doc();
      
      final deliveryMethod = DeliveryMethodModel(
        dmId: docDelivery.id,
        dmName : dmname,
        dmPrice : price
      );
      
      final map = deliveryMethod.toJson();
      
      await docDelivery.set(map);

      return 200;

    } on Exception catch (e) {

      return 100;

    }
  }

  @override
  Stream<List<DeliveryMethodModel>> readDeliveryMethods() => 
  FirebaseFirestore.instance
  .collection('deliverymethods')
  .snapshots()
  .map((snapshot) => 
      snapshot.docs.map((doc) => DeliveryMethodModel.fromJson(doc.data())).toList()
    );

  @override
  Future editDeliveryMethod(String dmid, String dmname, double price) async {

    try{
      final docDelivery = FirebaseFirestore.instance
      .collection("deliverymethods")
      .doc(dmid);

      await docDelivery.update({
        'deliveryMethodName' : dmname,
        'deliveryMethodPrice' : price
      });

    }on Exception catch (e){

      return 100;

    }   
  }

  @override
  Future deleteDeliveryMethod(String dmid) async {
    
    try{

      final docDelivery = FirebaseFirestore.instance
      .collection("deliverymethods")
      .doc(dmid);

      await docDelivery.delete();

    }on Exception catch (e){

      return 100;

    }
  }  
}