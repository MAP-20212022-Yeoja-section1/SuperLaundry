import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import '../../../app/service_locator.dart';
import '../../../services/registration/registrationService.dart';

class RegistrationViewmodel extends Viewmodel {

  RegisterationService get _registrationService => locator<RegisterationService>();
  var msg = 100;

  Future registerUser({
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