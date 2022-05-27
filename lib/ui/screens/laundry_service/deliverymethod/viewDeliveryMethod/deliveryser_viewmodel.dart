import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/service_locator.dart';
import '../../../../../models/deliveryMethodModel.dart';
import '../../../../../services/laundryservice/delivery_service.dart';

class DeliveryViewmodel extends Viewmodel {

  DeliveryManagementService get _deliveryManagementService => locator<DeliveryManagementService>();

  Future addDeliveryMethod({@required dmname, 
      @required dmprice}) async{

    return await _deliveryManagementService.addDeliveryMethod(dmname,dmprice);

  }

  Stream<List<DeliveryMethodModel>> readDeliveryMethods(){
    return _deliveryManagementService.readDeliveryMethods();
  }

  Future editDeliveryMethod({@required dmid, @required dmname, @required dmprice}) async{

    return await _deliveryManagementService.editDeliveryMethod(dmid,dmname,dmprice);

  }

  Future deleteDeliveryMethod({@required dmid}) async{

    return await _deliveryManagementService.deleteDeliveryMethod(dmid);

  }
}