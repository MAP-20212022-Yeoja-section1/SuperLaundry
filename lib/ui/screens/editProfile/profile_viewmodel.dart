import 'package:map_mvvm/viewmodel.dart';
import '../../../app/service_locator.dart';
import '../../../services/logout/logout_service.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/app/service_locator.dart';
import '../../../../../services/profile_service.dart';
import 'package:superlaundry/services/profile_service.dart';
import '../../../services/registration/login_service.dart';

class ProfileViewmodel extends Viewmodel {
  final ProfileService _profileService = locator<ProfileService>();
  final LoginService _loginService = locator<LoginService>();

  LogoutService get _logoutService => locator<LogoutService>();
  dynamic msg = '';

  Future logoutUser() async {
    msg = await _logoutService.logoutUser();
    return msg;
  }

  Future<Map<dynamic, dynamic>>? getUserData() async {
    return _profileService.getUserData();
  }

  Future getCurrentID() async {
    return _loginService.getCurrentUID();
  }

  Future editProfile({
    required String userId,
    required String name,
    required String email,
    required String phonenum,
    required String homeaddress,
  }) async {
    return await _profileService.editProfile(
        userId, name, email, phonenum, homeaddress);
  }
}
