import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/user.dart';

class ForgotPasswordService {
  final _auth = FirebaseAuth.instance;

  Future resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());

      Fluttertoast.showToast(
        msg: "Password reset email sent!",
        backgroundColor: Color.fromARGB(255, 29, 233, 182),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16,
          backgroundColor: Color.fromARGB(255, 179, 15, 3));
    }
  }
}
