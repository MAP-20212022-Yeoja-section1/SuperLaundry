import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import '../../../app/service_locator.dart';
import '../../../services/registration/registration_service.dart';

class RegistrationViewmodel extends Viewmodel {

  RegistrationService get _registrationService => locator<RegistrationService>();
  String msg="";

  Future<String> registerUser({
      @required name, 
      @required phonenum,
      @required homeaddress, 
      @required email,
      @required password, 
      @required role}) async {
          msg = await _registrationService.registerUser(name, phonenum, homeaddress, email, password, role);
          return msg;          
      }

}