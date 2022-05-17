import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import '../../../app/service_locator.dart';
import '../../../models/user.dart';
import '../../../services/registration/login_service.dart';

class LoginViewModel extends Viewmodel {
  LoginService get _loginService => locator<LoginService>();
  UserModel _user = UserModel();

  Future<void> logIn({
    @required email,
    @required password,
  }) async {
    await _loginService.logIn(email, password);
  }
}
