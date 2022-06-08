import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_screen.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_screen.dart';
import 'package:superlaundry/ui/screens/home_manager/mainmenuM_screen.dart';
import 'package:superlaundry/ui/screens/registration/registration_screen.dart';
import 'package:superlaundry/ui/screens/login/login_viewmodel.dart';
import '../forgot_pass/forgot_pass_screen.dart';

class LoginForm extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => LoginForm());

  @override
  LoginForm_ createState() => LoginForm_();
}

class LoginForm_ extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  dynamic msg = "";

  @override
  Widget build(BuildContext context) {
    return View<LoginViewModel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 110,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Super_Laundry.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please enter your registered email address.");
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email address.");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          decoration: const InputDecoration(
                            labelText: "Email Address",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Please enter your password.");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please enter valid password. (Min 6 Char)");
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 55,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 29, 233, 182)),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                msg = await viewmodel.logIn(
                                    email: emailController.text,
                                    password: passwordController.text);

                                if (msg == 200) {
                                  Fluttertoast.showToast(
                                    msg: "Login successful!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        Color.fromARGB(255, 69, 161, 76),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: msg.toString(),
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 79, 68),
                                  );

                                  // if (msg != "Login successful!") {
                                  //   Fluttertoast.showToast(
                                  //     msg: msg,
                                  //     toastLength: Toast.LENGTH_LONG,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     fontSize: 16,
                                  //     backgroundColor:
                                  //         Color.fromARGB(255, 235, 79, 68),
                                  //   );
                                  // } else {
                                  //   Navigator.of(context).pushReplacement(
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               mainMenuDScreen()));
                                  //   Fluttertoast.showToast(
                                  //     msg: msg,
                                  //     toastLength: Toast.LENGTH_LONG,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     fontSize: 16,
                                  //     backgroundColor:
                                  //         Color.fromARGB(255, 69, 161, 76),
                                  //   );
                                }
                              }
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassScreen()));
                                },
                                style: TextButton.styleFrom(
                                  primary: Color.fromARGB(255, 38, 201, 161),
                                ),
                                child: const Text("Forgot password?"))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an Account?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 93, 70),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegistrationScreen()));
                                },
                                style: TextButton.styleFrom(
                                  primary: Color.fromARGB(255, 38, 201, 161),
                                ),
                                child: const Text("Sign up here!"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
