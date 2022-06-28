import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_screen.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_screen.dart';
import 'package:superlaundry/ui/screens/home_manager/mainmenuM_screen.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_screen.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_screen.dart';
import 'package:superlaundry/ui/screens/print_invoice/print_invoice_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/registration/registration_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/forgot_pass/forgot_pass_screen.dart';
import '../ui/screens/add_order/add_order_screen.dart';
import '../ui/screens/print_invoice/print_invoice_screen.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String registrationRoute = '/registration';
  static const String loginRoute = '/login';
  static const String forgotPassRoute = '/forgot_pass';
  static const String custRoute = '/customer_Home';
  static const String manRoute = '/manager_Home';
  static const String delRoute = '/deliveryman_Home';
  static const String addOrderRoute = '/add_order';
  static const String orderHistoryRoute = '/order_history';
  static const String manageOrder = '/manage_order';
  static const String printInvoiceRoute = '/print_invoice';

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
      case addOrderRoute:
        return AddOrderScreen.route();
      case orderHistoryRoute:
        return OrderHistoryScreen.route();
      case manageOrder:
        return ManageOrderScreen.route();
      case printInvoiceRoute:
        return PrintInvoiceScreen.route();
    }
    return null;
  }
}
