import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import '../../../models/user.dart';
import '../../../app/service_locator.dart';
import '../../../services/forgot_pass/forgot_pass_service.dart';

class ForgotPassViewmodel extends Viewmodel {
  ForgotPasswordService get _forgotPasswordService =>
      locator<ForgotPasswordService>();
  UserModel _user = UserModel();

  Future<void> resetPassword({
    @required email,
  }) async {
    await _forgotPasswordService.resetPassword(email);
  }
}
