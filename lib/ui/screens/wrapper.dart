import 'package:flutter/material.dart';
// import 'package:superlaundry/ui/screens/home_customer/mainmenu_screen.dart';
// import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_screen.dart';
// import 'package:superlaundry/ui/screens/home_manager/mainmenuM_screen.dart';
// import 'package:mvvm_counter/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:superlaundry/models/user.dart';
import 'package:superlaundry/ui/screens/login/login_screen.dart';
import '/app/routes.dart';
import 'package:superlaundry/app/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return AuthenticateRoute();
    } else {
      return FutureBuilder<String>(
        future: getUserType(user),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data == "Customer") {
                return CustomerRoute();
              } else if (snapshot.data == "Deliveryman") {
                return DeliverymanRoute();
              } else if (snapshot.data == "Manager") {
                return ManagerRoute();
              } else {
                // print(snapshot.data);
                return LoginScreen();
              }
            }
          } else if (snapshot.hasError) {
            Text('no data');
          }
          return CircularProgressIndicator();
        },
      );
    }
  }
}

Future<String> getUserType(user) async {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.userId)
      .get()
      .then((value) {
    Map data = value.data() as Map;
    String role = data['role'].toString();
    return role;
  });
}

class AuthenticateRoute extends StatelessWidget {
  const AuthenticateRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'MVVM Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.amber,
          ),
      initialRoute: Routes.loginRoute,
      onGenerateRoute: Routes.createRoute,
    );
  }
}

class ManagerRoute extends StatelessWidget {
  const ManagerRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'MVVM Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.amber,
          ),
      initialRoute: Routes.manRoute,
      onGenerateRoute: Routes.createRoute,
    );
  }
}

class CustomerRoute extends StatelessWidget {
  const CustomerRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'MVVM Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.amber,
          ),
      initialRoute: Routes.custRoute,
      onGenerateRoute: Routes.createRoute,
    );
  }
}

class DeliverymanRoute extends StatelessWidget {
  const DeliverymanRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'MVVM Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.amber,
          ),
      initialRoute: Routes.delRoute,
      onGenerateRoute: Routes.createRoute,
    );
  }
}
