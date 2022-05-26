import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:superlaundry/app/service_locator.dart';
import 'package:superlaundry/models/user.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/ui/screens/wrapper.dart';
import 'app/routes.dart';
import 'package:provider/provider.dart';

Future main() async {
  initializeServiceLocator();
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keep splash screen until initialization has completed
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  initializeApp();
  // whenever your initialization is completed, remove the splash screen
  FlutterNativeSplash.remove();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const SuperLaundryApp());
}

class SuperLaundryApp extends StatelessWidget {
  const SuperLaundryApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: LoginService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
    // return MaterialApp(
    //   title: 'Super Laundry',
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: Routes.loginRoute,
    //   onGenerateRoute: Routes.createRoute,
    // );
  }
}

void initializeApp() {
  // pre-fetch resources during splash screen
  Future.delayed(Duration(seconds: 60));
}
