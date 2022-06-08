import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';

abstract class CleanManagementService {

  Future addCleanMethod(String cmname, double price);

  Stream<List<CleanMethodModel>> readCleanMethods();

  Future editCleanMethod(String cmid, String cmname, double price);

  Future deleteCleanMethod(String cmid);

}

class CleanManagementServiceMock extends CleanManagementService{


  @override
  Future addCleanMethod(String name, double price) async {

    try {
      final docClean = FirebaseFirestore.instance.collection("cleanmethods").doc();
      
      final cleanMethod = CleanMethodModel(
        cmId: docClean.id,
        cmName : name,
        cmPrice : price
      );
      
      final map = cleanMethod.toJson();
      
      await docClean.set(map);

      return 200;

    } on Exception catch (e) {

      return 100;

    }
  }

  Stream<List<CleanMethodModel>> readCleanMethods() => 
  FirebaseFirestore.instance
  .collection('cleanmethods')
  .snapshots()
  .map((snapshot) => 
      snapshot.docs.map((doc) => CleanMethodModel.fromJson(doc.data())).toList()
    );

  @override
  Future editCleanMethod(String cmid, String cmname, double price) async {

    try{
      final docClean = FirebaseFirestore.instance
      .collection("cleanmethods")
      .doc(cmid);

      await docClean.update({
        'cleanMethodName' : cmname,
        'cleanMethodPrice' : price
      });

    }on Exception catch (e){

      return 100;

    }   
  }

  @override
  Future deleteCleanMethod(String cmid) async {
    
    try{

      final docClean = FirebaseFirestore.instance
      .collection("cleanmethods")
      .doc(cmid);

      await docClean.delete();

    }on Exception catch (e){

      return 100;

    }
  }
}