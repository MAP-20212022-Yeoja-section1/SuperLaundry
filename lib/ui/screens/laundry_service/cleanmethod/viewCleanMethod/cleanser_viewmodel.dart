import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/service_locator.dart';
import '../../../../../models/cleanMethodModel.dart';
import '../../../../../services/laundryservice/clean_service.dart';

class CleanViewmodel extends Viewmodel {

  CleanManagementService get _cleanManagementService => locator<CleanManagementService>();

  Future addCleanMethod({@required cmname, 
      @required cmprice}) async{

    return await _cleanManagementService.addCleanMethod(cmname,cmprice);

  }

  Stream<List<CleanMethodModel>> readCleanMethods(){
    return _cleanManagementService.readCleanMethods();
  }

  Future editCleanMethod({@required cmid, @required cmname, @required cmprice}) async{

    return await _cleanManagementService.editCleanMethod(cmid,cmname,cmprice);

  }

  Future deleteCleanMethod({@required cmid}) async{

    return await _cleanManagementService.deleteCleanMethod(cmid);

  }

}