import 'package:superlaundry/models/cleanMethodModel.dart';

abstract class CleanManagementService {

  Future addCleanMethod(String cmname, double price);

  Stream<List<CleanMethodModel>> readCleanMethods();

  Future editCleanMethod(String cmid, String cmname, double price);

  Future deleteCleanMethod(String cmid);

}
