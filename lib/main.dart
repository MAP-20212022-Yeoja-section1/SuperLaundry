import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:superlaundry/app/service_locator.dart';

import 'app/routes.dart';

void main() {
  initializeServiceLocator();
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keep splash screen until initialization has completed
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  initializeApp();
  // whenever your initialization is completed, remove the splash screen
  FlutterNativeSplash.remove();

  runApp(const SuperLaundryApp());
}

class SuperLaundryApp extends StatelessWidget {
  const SuperLaundryApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Laundry',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeRoute,
      onGenerateRoute: Routes.createRoute,
    );
  }
}

void initializeApp() {
  // pre-fetch resources during splash screen
  Future.delayed(Duration(seconds: 60));
}
