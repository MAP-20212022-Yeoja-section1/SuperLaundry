import 'package:firebase_auth/firebase_auth.dart';

class LogoutService {

  final _auth = FirebaseAuth.instance;

  Future logoutUser() async {   
      await _auth.signOut();
  }
}