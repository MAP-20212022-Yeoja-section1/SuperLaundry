import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import '../../../models/user.dart';
import '../../../app/service_locator.dart';
import '../../../services/forgot_pass/forgot_pass_service.dart';

class ForgotPassViewmodel extends Viewmodel {
  ForgotPasswordService get _forgotPasswordService =>
      locator<ForgotPasswordService>();

  String msg = "";

  Future<String> resetPassword({
    @required email,
  }) async {
    msg = await _forgotPasswordService.resetPassword(email);
    return msg;
  }
}
