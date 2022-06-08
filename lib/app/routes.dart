import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_screen.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_screen.dart';
import 'package:superlaundry/ui/screens/home_manager/mainmenuM_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/registration/registration_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/forgot_pass/forgot_pass_screen.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String registrationRoute = '/registration';
  static const String loginRoute = '/login';
  static const String forgotPassRoute = '/forgot_pass';
  static const String custRoute = '/customer_Home';
  static const String manRoute = '/manager_Home';
  static const String delRoute = '/deliveryman_Home';

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
      case custRoute:
        return mainMenuScreen.route();
      case manRoute:
        return mainMenuMScreen.route();
      case delRoute:
        return mainMenuDScreen.route();
    }
    return null;
  }
}
