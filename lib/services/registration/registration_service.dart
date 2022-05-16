import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/user.dart';

class RegistrationService {

  final _auth = FirebaseAuth.instance;

  Future registerUser(String name, String phonenum, String homeaddress, String email, String password, String role) async{
    try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) => {
      postDetailsToFirestore(name, phonenum, homeaddress, email, password, role)
    });
    } catch (e){
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16,
        backgroundColor: Color.fromARGB(255, 179, 15, 3),
        );
    }
  }

  postDetailsToFirestore(String name, String phonenum, String homeaddress, String email, String password, String role) async{
    
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    
    userModel.email = user!.email!;
    userModel.userId = user.uid;
    userModel.name = name;
    userModel.phonenum = phonenum;
    userModel.homeaddress = homeaddress;
    userModel.password = password;
    userModel.role = role;

    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Your account has been created successfully!",
    toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16,
        backgroundColor: Color.fromARGB(255, 0, 121, 10),
    );
  }

}