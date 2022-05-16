import 'package:flutter/material.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/registration/registration_screen.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String registrationRoute = '/registration';

  static Route<dynamic>? createRoute(settings) {
    switch (settings.name) {
      case homeRoute:
        return HomeScreen.route();
      case registrationRoute:
        return RegistrationScreen.route();
    }
    return null;
  }
}
