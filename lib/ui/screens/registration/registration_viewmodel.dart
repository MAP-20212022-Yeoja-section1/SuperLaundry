import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import '../../../app/service_locator.dart';
import '../../../models/user.dart';
import '../../../services/registration/registration_service.dart';

class RegistrationViewmodel extends Viewmodel {

  RegistrationService get _registrationService => locator<RegistrationService>();
  UserModel _user = UserModel();

  Future<void> registerUser({
      @required name, 
      @required phonenum,
      @required homeaddress, 
      @required email,
      @required password, 
      @required role}) async {
        await _registrationService.registerUser(name, phonenum, homeaddress, email, password, role);
      }

}