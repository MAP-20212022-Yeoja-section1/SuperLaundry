import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/services/forgot_pass/forgot_pass_service.dart';

class ForgotPasswordServicewithFirebase extends ForgotPasswordService {
  final _auth = FirebaseAuth.instance;

  @override
  Future resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      return 101;
    } on FirebaseAuthException catch (e) {
      return 200;
    }
  }
}
