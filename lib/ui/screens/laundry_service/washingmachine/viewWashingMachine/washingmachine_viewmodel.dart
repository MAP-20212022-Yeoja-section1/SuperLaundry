import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/service_locator.dart';
import '../../../../../models/washingMachineModel.dart';
import '../../../../../services/laundryservice/washingmachine_service.dart';

class WashingMachineViewmodel extends Viewmodel {

  WashingMachineManagementService get _washingMachineManagementService => locator<WashingMachineManagementService>();

  Future addWashingMachine({@required weight, @required cold, @required warm, @required hot}) async{

    return await _washingMachineManagementService.addWashingMachine(weight,cold,warm,hot);

  }

  Stream<List<WashingMachineModel>> readWashingMachines(){
    return _washingMachineManagementService.readWashingMachines();
  }

  Future editWashingMachine({@required wmid, @required weight, @required cold, @required warm, @required hot}) async{

    return await _washingMachineManagementService.editWashingMachine(wmid,weight,cold,warm,hot);

  }

  Future deleteWashingMachine({@required wmid}) async{

    return await _washingMachineManagementService.deleteWashingMachine(wmid);

  }
}