import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/viewCleanMethod/cleanser_screen.dart';
import '../viewCleanMethod/cleanser_viewmodel.dart';


class AddCleanMethod extends StatefulWidget{

  @override
  AddCleanMethodState createState() => AddCleanMethodState();

}

class AddCleanMethodState extends State<AddCleanMethod>{

  final _formKey = GlobalKey<FormState>();
  final cmnameController = TextEditingController();
  final cmpriceController = TextEditingController();

    @override   
    Widget build(BuildContext context){
      return View<CleanViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => Scaffold(
        appBar: AppBar(
        title: Text('LAUNDRY SERVICE'),
        leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CleanScreen()));
        },
        icon: Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 31, 215, 169),
        foregroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child:Form(
                key:_formKey,
                  child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  //clean method name
                  TextFormField(
                    controller: cmnameController,
                    decoration: const InputDecoration(labelText: 'Clean method name'),
                    validator: (value){
                      if (cmnameController.text.isEmpty){
                        return "Enter the clean method name!";
                      }
                      return null;
                    },
                    onSaved: (value){
                            cmnameController.text = value!;
                          },
                    
                  ),
                  TextFormField(
                    controller: cmpriceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                    decoration: const InputDecoration(labelText: 'Clean method price'),
                    validator: (value){
                      if (cmpriceController.text.isEmpty){
                        return "Enter the clean method price!";
                      }else{return null;}
                    },
                    onSaved: (value){
                            cmpriceController.text = value!;
                          },
                    
                  ),
                  Padding(
                  padding: EdgeInsets.only(top:20),
                  child: FloatingActionButton.extended(
                  onPressed: ()async {
                    if (_formKey.currentState!.validate()){
                      
                      dynamic msg = await viewmodel.addCleanMethod(cmname: cmnameController.text, 
                      cmprice: double.parse(cmpriceController.text));
                      
                      if(msg==100){
                      Fluttertoast.showToast(
                        msg: "Error! Unable to add a new clean method.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16,
                        backgroundColor: Color.fromARGB(255, 209, 68, 58),
                      );}
                      else{
                      Fluttertoast.showToast(msg: "New clean method is successfully added!",
                          toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16,
                              backgroundColor: Color.fromARGB(255, 69, 161, 76),
                          );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CleanScreen()));
                      }                                  
                    }                   
                    },
                  label: Text(
                  'Add',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
                  highlightElevation: 10.0,
                  backgroundColor: Color.fromARGB(255,31, 215, 169),
              ),)
                ]
                )
              )
        )
      )
      )
      );
    }
}