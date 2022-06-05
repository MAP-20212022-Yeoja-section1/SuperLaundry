import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/washingMachineModel.dart';

abstract class WashingMachineManagementService {

  Future addWashingMachine(double weight, double cold, double warm, double hot);

  Stream<List<WashingMachineModel>> readWashingMachines();

  Future editWashingMachine(String wmid, double weight, double cold, double warm, double hot);

  Future deleteWashingMachine(String wmid);

}

class WashingMachineManagementServiceMock extends WashingMachineManagementService{

  @override
  Future addWashingMachine(double weight, double cold, double warm, double hot) async {

    try {
      final docWM = FirebaseFirestore.instance.collection("washingmachines").doc();
      
      final washingMachine = WashingMachineModel(
        wmId: docWM.id,
        wmWeight: weight,
        wmCold: cold,
        wmWarm: warm,
        wmHot: hot,
      );
      
      final map = washingMachine.toJson();
      
      await docWM.set(map);

      return 200;

    } on Exception catch (e) {

      return 100;

    }
  }

  Stream<List<WashingMachineModel>> readWashingMachines() => 
  FirebaseFirestore.instance
  .collection('washingmachines')
  .snapshots()
  .map((snapshot) => 
      snapshot.docs.map((doc) => WashingMachineModel.fromJson(doc.data())).toList()
    );

  @override
  Future editWashingMachine(String wmid, double weight, double cold, double warm, double hot) async {

    try{
      final docWM = FirebaseFirestore.instance
      .collection("washingmachines")
      .doc(wmid);

      await docWM.update({
        'wmWeight' : weight,
        'wmCold' : cold,
        'wmWarm' : warm,
        'wmHot' : hot,       
      });

    }on Exception catch (e){

      return 100;

    }   
  }

  @override
  Future deleteWashingMachine(String wmid) async {
    
    try{

      final docWM = FirebaseFirestore.instance
      .collection("washingmachines")
      .doc(wmid);

      await docWM.delete();

    }on Exception catch (e){

      return 100;

    }
  }
}