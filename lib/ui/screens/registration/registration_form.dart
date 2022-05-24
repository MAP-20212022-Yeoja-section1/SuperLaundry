import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/registration/registration_viewmodel.dart';

class RegistrationForm extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> RegistrationForm());

  @override
  _RegistrationForm createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  
  final _formKey = GlobalKey<FormState>();
  var msg=100;

  final nameController = TextEditingController();
  final phonenumController = TextEditingController();
  final homeaddressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final roleController = TextEditingController();

  List<String> items = ['Customer', 'Manager', 'Deliveryman'];
  String? selectedRole = 'Customer';

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return View<RegistrationViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) =>Stack(
      children: <Widget>[
      Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 167, 255, 235)),
      ),
      Center(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              height: 480,
              width: 380,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 217, 255, 245),
                borderRadius: BorderRadius.all(const Radius.circular(25)),
                boxShadow: const [ BoxShadow(color: Colors.grey, blurRadius: 2.0, offset: Offset(2.0, 2.0))],
              ),
              padding: const EdgeInsets.only(left: 28.0, top: 20.0, right: 28.0),
              child: Form(
                key:_formKey,
                  child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  //name
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value){
                      if (nameController.text.isEmpty){
                        return "Enter your name!";
                      }
                      return null;
                    },
                    onSaved: (value){
                            nameController.text = value!;
                          },
                    
                  ),
                  //phone number
                  TextFormField(
                    controller: phonenumController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    validator: (value){
                      if (phonenumController.text.isEmpty){
                        return "Enter your phone number!";
                      }
                      return null;
                    },
                    onSaved: (value){
                            phonenumController.text = value!;
                          },
                    
                  ),
                  //home address
                  TextFormField(
                    controller: homeaddressController,
                    decoration: const InputDecoration(labelText: 'Home Address'),
                    validator: (value){
                      if (homeaddressController.text.isEmpty){
                        return "Enter your home address!";
                      }
                      return null;
                    },
                    onSaved: (value){
                            homeaddressController.text = value!;
                          },                  
                  ),
                  //email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value){
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
                    onSaved: (value){
                            emailController.text = value!;
                          },                 
                  ),
                  //password
                  TextFormField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure
                          ? Icons.visibility
                          : Icons.visibility_off
                          )
                      ),),
                      validator: (value){
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Please enter your password.");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please enter valid password. (Min 6 Char)");
                            }
                          },
                      onSaved: (value){
                            passwordController.text = value!;
                          },
                    
                  ),
                  TextFormField(
                    controller: cpasswordController,
                    decoration: const InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value){
                      if(cpasswordController.text.isNotEmpty)
                      {
                        if (cpasswordController.text != passwordController.text){
                        return "Password does not match!";}
                        else {return null;}
                      } 
                      else{return "Enter confirm password!";}                     
                    },
                    onSaved: (value){
                            cpasswordController.text = value!;
                          },
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: roleController,
                      decoration: InputDecoration(
                        labelText: "Select a role",
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down, size: 40,),
                          onSelected: (String value){
                            roleController.text = value;
                          },
                          itemBuilder: (BuildContext context){
                            return items
                                  .map<PopupMenuItem<String>>((String value){
                                    return new PopupMenuItem(child: new Text(value), value: value);
                                  }).toList();
                          },
                        )
                      ),
                      validator: (value){
                      if (roleController.text=='Customer' || roleController.text=='Manager' || roleController.text=='Deliveryman'){
                        return null;
                      }
                      return "Must be Customer, Manager or Deliveryman only";
                    },
                      onSaved: (value){
                            roleController.text = value!;
                          },
                    ),
                  )                                   
                ]),
              ))),
                Padding(
                  padding: EdgeInsets.only(top:20),
                  child: FloatingActionButton.extended(
                  onPressed: ()async {
                    if (_formKey.currentState!.validate()){
                      
                      msg = await viewmodel.registerUser(name: nameController.text, 
                      phonenum: phonenumController.text, 
                      homeaddress: homeaddressController.text, 
                      email: emailController.text,
                      password: passwordController.text,
                      role: roleController.text);
                      
                      if(msg==100){
                      Fluttertoast.showToast(
                        msg: "Email entered has been registered!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16,
                        backgroundColor: Color.fromARGB(255, 209, 68, 58),
                      );}
                      else{
                      Fluttertoast.showToast(msg: "Registered Successfully!",
                          toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16,
                              backgroundColor: Color.fromARGB(255, 69, 161, 76),
                          );
                      }                                  
                    }                   
                    },
                  label: Text(
                  'Register',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
                  highlightElevation: 10.0,
                  backgroundColor: Color.fromARGB(255,31, 215, 169),
              ),)
        ]),
      )),                
      ])
    );
  }
}