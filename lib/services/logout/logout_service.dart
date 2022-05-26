import 'package:firebase_auth/firebase_auth.dart';

class LogoutService {
  // final _auth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future logoutUser() async {
    try {
      await _auth.signOut();
      return "Logout successful!";
    } catch (e) {
      return "Logout unsucessful!";
    }
  }
}
