// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider/.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:superlaundry/models/user.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'profile_viewmodel.dart';
import 'package:superlaundry/ui/screens/editProfile/profile_viewmodel.dart';
import 'package:superlaundry/services/profile_service.dart';

class ProfileBody extends StatefulWidget {
  // static Route route() => MaterialPageRoute(builder: (_) => ProfileBody());
  const ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final _formKey = GlobalKey<FormState>();
  String message = '';
  // bool loading = true;
  String name = '';
  String email = '';
  String phonenum = '';
  String homeaddress = '';
  String name_ = '';
  String email_ = '';
  String phonenum_ = '';
  String homeaddress_ = '';
  final GlobalKey _nameKey = GlobalKey();
  final GlobalKey _emailKey = GlobalKey();
  final GlobalKey _phonenumKey = GlobalKey();
  final GlobalKey _homeaddressKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        alignment: Alignment.center,
        child: View<ProfileViewmodel>(
            builder: (_, viewmodel) => Container(
                child: FutureBuilder<Map>(
                    future: viewmodel.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> data =
                            snapshot.data as Map<String, dynamic>;
                        name_ = data['name'] ?? '';
                        email_ = data['email'] ?? '';
                        phonenum_ = data['phonenum'] ?? '';
                        homeaddress_ = data['homeaddress'] ?? '';
                        return ListView(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(children: <Widget>[
                                // SizedBox(height: 40),
                                const Text(
                                  "Your Profile",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  key: _nameKey,
                                  initialValue: '${data['name']}',
                                  decoration: const InputDecoration(
                                      labelText: 'Full Name'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Your name cannot be empty'
                                      : null,
                                  onChanged: (value) {
                                    setState(() => name = value);
                                  },
                                ),
                                TextFormField(
                                  key: _emailKey,
                                  initialValue: '${data['email']}',
                                  decoration:
                                      const InputDecoration(labelText: 'Email'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Your email must cannot be empty'
                                      : null,
                                  onChanged: (value) {
                                    setState(() => email = value);
                                  },
                                ),
                                TextFormField(
                                  key: _phonenumKey,
                                  initialValue: '${data['phonenum']}',
                                  decoration: const InputDecoration(
                                      labelText: 'Phone Number'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Your phone number cannot be empty'
                                      : null,
                                  onChanged: (value) {
                                    setState(() => phonenum = value);
                                  },
                                ),
                                TextFormField(
                                  key: _homeaddressKey,
                                  initialValue: '${data['homeaddress']}',
                                  decoration: const InputDecoration(
                                      labelText: 'Home Address'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Your address must be filled'
                                      : null,
                                  onChanged: (value) {
                                    setState(() => homeaddress = value);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: FloatingActionButton.extended(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        // setState(() => loading = true);

                                        if (name.isEmpty) {
                                          setState(() {
                                            name = name_;
                                          });
                                        }

                                        if (email.isEmpty) {
                                          setState(() {
                                            email = email_;
                                          });
                                        }

                                        if (phonenum.isEmpty) {
                                          setState(() {
                                            phonenum = phonenum_;
                                          });
                                        }

                                        if (homeaddress.isEmpty) {
                                          setState(() {
                                            homeaddress = homeaddress_;
                                          });
                                        }

                                        dynamic msg =
                                            await viewmodel.editProfile(
                                                userId: await viewmodel
                                                    .getCurrentID(),
                                                name: name,
                                                email: email,
                                                phonenum: phonenum,
                                                homeaddress: homeaddress);

                                        if (msg == 100) {
                                          Fluttertoast.showToast(
                                            msg:
                                                "Eror! Unable to update the new Information.",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            fontSize: 16,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 209, 68, 58),
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:
                                                "Your profile information is updated successfully!",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            fontSize: 16,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 69, 161, 76),
                                          );
                                        }
                                      }
                                    },
                                    label: const Text('Update Profile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    highlightElevation: 10.0,
                                    backgroundColor:
                                        const Color.fromARGB(255, 31, 215, 169),
                                  ),
                                )
                              ]),
                            )
                          ],
                        );
                      } else {
                        return ListView();
                      } //else block
                    } //snapshot
                    ))));
  }
}
