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
      return "Password reset email sent!";
    } on FirebaseAuthException catch (e) {

      return e.toString();
    }
  }
}
