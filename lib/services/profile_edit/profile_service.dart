// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileService {
  final String? uid;
  ProfileService({this.uid});
  Future<Map> getUserData();
  Stream<DocumentSnapshot> getData();
  Future<void> editProfile(String userId, String name, String email,
      String phonenum, String homeaddress);
}
