import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superlaundry/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mvvm_counter/services/profile_service.dart';
import 'package:superlaundry/services/profile_service.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/app/service_locator.dart';

class ProfileService {
  final String? uid;
  ProfileService({this.uid});
  final LoginService _auth = locator<LoginService>();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Future<void> editProfile(String userId, String name, String email,
      String phonenum, String homeaddress) async {
    await _users.doc(userId).update({
      'name': name,
      'email': email,
      'phonenum': phonenum,
      'homeaddress': homeaddress,
    });
  }

  Future<Map> getUserData() async {
    final uid = await _auth.getCurrentUID();
    var users;
    var data = await _users.doc(uid).get().then((value) {
      users = {
        'userId': value['userId'],
        'name': value['name'],
        'email': value['email'],
        'phonenum': value['phonenum'],
        'homeaddress': value['homeaddress'],
      };
      return users;
    });
    return data;
  }

  Stream<DocumentSnapshot> getData() {
    return _users.doc(uid).snapshots();
  }
}
