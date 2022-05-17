import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/registration/registration_screen.dart';
import 'package:superlaundry/ui/screens/login/login_viewmodel.dart';

class LoginForm extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => LoginForm());

  @override
  LoginForm_ createState() => LoginForm_();
}

class LoginForm_ extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/images/Super_Laundry.png'),
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
                            RegExp regex = new RegExp(r'^.{6,}$');
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                viewmodel.logIn(
                                    email: emailController.text,
                                    password: passwordController.text);
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
                                onPressed: () {},
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
                                child: const Text("Sign up here."))
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
