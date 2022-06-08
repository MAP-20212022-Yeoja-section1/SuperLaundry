import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
// import 'package:superlaundry/ui/screens/registration/registration_form.dart';
import 'package:superlaundry/ui/screens/editProfile/profile_body.dart';
import 'profile_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => ProfileScreen());

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  // String myEmail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const profileAppBar(),
        body: ProfileBody(),
      ),
    );
  }
}
