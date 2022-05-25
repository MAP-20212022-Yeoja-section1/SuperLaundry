import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/services/registration/registrationService.dart';
import '../../models/user.dart';

class RegistrationServiceWithFireBase extends RegisterationService {

  final _auth = FirebaseAuth.instance;

  @override
  Future registerUser(String name, String phonenum, String homeaddress, String email, String password, String role) async{
    try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) => {
      postDetailsToFirestore(name, phonenum, homeaddress, email, password, role)
    }); return 0;
    } on FirebaseAuthException catch (e){

        return 100;
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
  }

}