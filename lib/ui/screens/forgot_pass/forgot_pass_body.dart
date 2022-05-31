import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:map_mvvm/map_mvvm.dart';
// import '../../screens/home/home_viewmodel.dart';
import 'package:map_mvvm/view.dart';
import '../../screens/forgot_pass/forgot_pass_viewmodel.dart';
import '../login/login_screen.dart';

class ForgotPassBody extends StatefulWidget {
  // const ForgotPassBody({
  //   Key? key,
  // }) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => ForgotPassBody());

  @override
  _ForgotPassBody createState() => _ForgotPassBody();
}

class _ForgotPassBody extends State<ForgotPassBody> {
  final _formKey = GlobalKey<FormState>();
  late String txtemail;
  var msg = 101;

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return View<ForgotPassViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.white, Colors.white])),
                child: Scaffold(
                  body: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.08),
                        // height: height * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),

                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/forgotpassword.png'),
                                width: 90,
                                height: 90,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Trouble Logging In?',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Enter your email registered and we will',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'send you a link to get back into your account.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (emailController.text.isEmpty) {
                                        return "Please enter your registered email";
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "Your Email...",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 1.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: Colors.lightGreenAccent),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      contentPadding: EdgeInsets.all(12),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: Colors.grey),
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 30, left: 30),
                              child: RaisedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    msg = await viewmodel.resetPassword(
                                        email: emailController.text);
                                    if (msg != 101) {
                                      //integer (const value) variable name
                                      Fluttertoast.showToast(
                                        msg:
                                            ("Invalid email, please insert your registered email!"),
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        fontSize: 16,
                                        backgroundColor:
                                            Color.fromARGB(255, 179, 15, 3),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg:
                                            ("Your reset password email has been sent!"),
                                        backgroundColor:
                                            Color.fromARGB(255, 29, 233, 182),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  'Send Login Link',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 1.2),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textColor: Colors.white,
                                color: Color.fromARGB(255, 29, 233, 182),
                                focusColor: Colors.green,
                                hoverColor: Colors.green,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text('Back To Login'),
                                textColor: Colors.blue[600],
                                color: Colors.white,
                                focusColor: Colors.blue[300],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]));
  }
}
