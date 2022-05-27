import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/deliveryMethodModel.dart';

abstract class DeliveryManagementService {

  Future addDeliveryMethod(String dmname, double price);

  Stream<List<DeliveryMethodModel>> readDeliveryMethods();

  Future editDeliveryMethod(String dmid, String dmname, double price);

  Future deleteDeliveryMethod(String dmid);
}

class DeliveryManagementServiceMock extends DeliveryManagementService{

  @override
  Future addDeliveryMethod(String name, double price) async {

    try {
      final docDelivery = FirebaseFirestore.instance.collection("deliverymethods").doc();
      
      final deliveryMethod = DeliveryMethodModel(
        dmId: docDelivery.id,
        dmName : name,
        dmPrice : price
      );
      
      final map = deliveryMethod.toJson();
      
      await docDelivery.set(map);

      return 0;

    } on Exception catch (e) {

      return 100;

    }
  }

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