import 'package:firebase_auth/firebase_auth.dart';

abstract class LogoutService{
  Future logoutUser();
}

class LogoutServiceMock extends LogoutService {
  // final _auth = FirebaseAuth.instance;
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
