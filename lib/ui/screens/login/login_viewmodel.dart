import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import '../../../app/service_locator.dart';
import '../../../services/registration/login_service.dart';

class LoginViewModel extends Viewmodel {
  LoginService get _loginService => locator<LoginService>();
  dynamic msg = "";

  Future logIn({
    @required email,
    @required password,
  }) async {
    msg = await _loginService.logIn(email, password);
    return msg;
  }
}
