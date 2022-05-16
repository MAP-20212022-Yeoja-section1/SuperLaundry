import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/registration/registration_viewmodel.dart';

class RegistrationForm extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_)=> RegistrationForm());

  @override
  _RegistrationForm createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  
  final _formKey = GlobalKey<FormState>();
  late String txtname, txtemail, txtpassword, txtphonenum, txtaddress, txtcpassword, txtrole="";

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
                    onSaved: (value){
                            txtname = value!;
                          },
                    validator: (value){
                      if (nameController.text.isEmpty){
                        return "Enter your name!";
                      }
                      return null;
                    }
                  ),
                  //phone number
                  TextFormField(
                    controller: phonenumController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    onSaved: (value){
                            txtphonenum = value!;
                          },
                    validator: (value){
                      if (phonenumController.text.isEmpty){
                        return "Enter your phone number!";
                      }
                      return null;
                    }
                  ),
                  //home address
                  TextFormField(
                    controller: homeaddressController,
                    decoration: const InputDecoration(labelText: 'Home Address'),
                    onSaved: (value){
                            txtaddress = value!;
                          },
                    validator: (value){
                      if (homeaddressController.text.isEmpty){
                        return "Enter your home address!";
                      }
                      return null;
                    }
                  ),
                  //email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    onSaved: (value){
                            txtemail = value!;
                          },
                    validator: (value){
                      if (emailController.text.isEmpty){
                        return "Enter your email!";
                      }
                      return null;
                    }
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
                      onSaved: (value){
                            txtpassword = value!;
                          },
                    validator: (value){
                      if (passwordController.text.isEmpty){
                        return "Enter your password!";
                      }
                      return null;
                    }
                  ),
                  TextFormField(
                    controller: cpasswordController,
                    decoration: const InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    onSaved: (value){
                            txtcpassword = value!;
                          },
                    validator: (value){
                      if(cpasswordController.text.isNotEmpty)
                      {
                        if (cpasswordController.text != passwordController.text){
                        return "Password does not match!";}
                        else {return null;}
                      } 
                      else{return "Enter confirm password!";}                     
                    }
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
                    }
                    ),
                  )                                   
                ]),
              ))),
                Padding(
                  padding: EdgeInsets.only(top:20),
                  child: FloatingActionButton.extended(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      viewmodel.registerUser(name: nameController.text, phonenum: phonenumController.text, homeaddress: homeaddressController.text, email: emailController.text,password: passwordController.text,role: roleController.text);
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