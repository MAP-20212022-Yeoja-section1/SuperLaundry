import 'package:map_mvvm/viewmodel.dart';
import '../../../app/service_locator.dart';
import '../../../services/logout/logout_service.dart';

class MenumViewmodel extends Viewmodel {
  LogoutService get _logoutService => locator<LogoutService>();
  dynamic msg = '';

  Future logoutUser() async {
    msg = await _logoutService.logoutUser();
    return msg;
  }
}
