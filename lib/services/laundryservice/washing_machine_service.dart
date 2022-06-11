import '../../models/washingMachineModel.dart';

abstract class WashingMachineManagementService {

  Future addWashingMachine(double weight, double cold, double warm, double hot);

  Stream<List<WashingMachineModel>> readWashingMachines();

  Future editWashingMachine(String wmid, double weight, double cold, double warm, double hot);

  Future deleteWashingMachine(String wmid);

}
