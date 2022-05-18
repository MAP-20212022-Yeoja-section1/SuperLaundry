import 'package:flutter/material.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/registration/registration_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/forgot_pass/forgot_pass_screen.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String registrationRoute = '/registration';
  static const String loginRoute = '/login';
  static const String forgotPassRoute = '/forgot_pass';

  static Route<dynamic>? createRoute(settings) {
    switch (settings.name) {
      case homeRoute:
        return HomeScreen.route();
      case registrationRoute:
        return RegistrationScreen.route();
      case loginRoute:
        return LoginScreen.route();
      case forgotPassRoute:
        return ForgotPassScreen.route();
    }
    return null;
  }
}
