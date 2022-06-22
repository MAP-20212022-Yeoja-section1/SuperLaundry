import 'forgot_pass.dart';

class ForgotPassViewmodel extends Viewmodel {
  ForgotPasswordService get _forgotPasswordService =>
      locator<ForgotPasswordService>();

  var msg = 101;

  Future resetPassword({
    @required email,
  }) async {
    msg = await _forgotPasswordService.resetPassword(email);
    return msg;
  }
}
