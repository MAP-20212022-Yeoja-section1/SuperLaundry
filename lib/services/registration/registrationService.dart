import '../../models/user.dart';

abstract class RegisterationService {

  Future registerUser(String name, String phonenum, String homeaddress, String email, String password, String role);
  
}