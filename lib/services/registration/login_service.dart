import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginService {
  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  Future logIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => RegistrationScreen())),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Email address entered is invalid.";
          break;
        case "wrong-password":
          errorMessage =
              "The password entered is wrong. (Does not match with the registered email)";
          break;
        case "user-not-found":
          errorMessage = "Email address not found. Please register.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests. Please try again later.";
          break;
        default:
          errorMessage = "Undefined error.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}
