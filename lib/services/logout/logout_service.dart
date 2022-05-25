import 'package:firebase_auth/firebase_auth.dart';

abstract class LogoutService {

  Future logoutUser();
}

class LogoutServiceFirebase extends LogoutService{

  final _auth = FirebaseAuth.instance;

  @override
  Future logoutUser() async { 
    try{
      await _auth.signOut();
      return true;
    }catch(e){
      return false;
    }  
      
  }

}