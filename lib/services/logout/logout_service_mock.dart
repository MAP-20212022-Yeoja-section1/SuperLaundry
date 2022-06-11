import 'package:firebase_auth/firebase_auth.dart';
import 'logout_service.dart';

class LogoutServiceMock extends LogoutService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future logoutUser() async {
    try {
      await _auth.signOut();
      return 200;
    } catch (e) {
      return 100;
    }
  }
}
