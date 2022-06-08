import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/user.dart';
import 'package:superlaundry/services/orderhistory/orderhistory_service.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_screen.dart';

class LoginService {
  final String? uid;
  LoginService({this.uid});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final _auth = FirebaseAuth.instance;

  String errorMessage = "";

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserModel(
            userId: user.uid,
            name: '',
            phonenum: '',
            homeaddress: '',
            email: '',
            password: '',
            role: '',
          )
        : null;
  }

  // User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null ? User(uid.user.id) : null;
  // }

  Stream<UserModel?> get user {
    return _auth
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  Future<String> getCurrentUID() async {
    return _auth.currentUser!.uid;
  }

  Future logIn(String email, String password) async {
    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // User? user = _auth.currentUser;

    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {});
      return 200;
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
      return errorMessage;
    }
  }
}
