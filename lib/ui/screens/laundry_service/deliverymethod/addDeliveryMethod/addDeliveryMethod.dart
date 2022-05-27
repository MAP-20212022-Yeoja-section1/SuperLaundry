import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/laundry_service/deliverymethod/viewDeliveryMethod/deliveryser_screen.dart';
import '../viewDeliveryMethod/deliveryser_viewmodel.dart';


class AddDeliveryMethod extends StatefulWidget{

  @override
  AddDeliveryMethodState createState() => AddDeliveryMethodState();

}

class AddDeliveryMethodState extends State<AddDeliveryMethod>{

  final _formKey = GlobalKey<FormState>();
  final dmnameController = TextEditingController();
  final dmpriceController = TextEditingController();

    @override   
    Widget build(BuildContext context){
      return View<DeliveryViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => Scaffold(
        appBar: AppBar(
        title: Text('LAUNDRY SERVICE'),
        leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryScreen()));
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
                  TextFormField(
                    controller: dmnameController,
                    decoration: const InputDecoration(labelText: 'Delivery method name'),
                    validator: (value){
                      if (dmnameController.text.isEmpty){
                        return "Enter the delivery method name!";
                      }
                      return null;
                    },
                    onSaved: (value){
                            dmnameController.text = value!;
                          },
                    
                  ),
                  TextFormField(
                    controller: dmpriceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                    decoration: const InputDecoration(labelText: 'Clean method price'),
                    validator: (value){
                      if (dmpriceController.text.isEmpty){
                        return "Enter the clean method price!";
                      }else{return null;}
                    },
                    onSaved: (value){
                            dmpriceController.text = value!;
                          },
                    
                  ),
                  Padding(
                  padding: EdgeInsets.only(top:20),
                  child: FloatingActionButton.extended(
                  onPressed: ()async {
                    if (_formKey.currentState!.validate()){
                      
                      var msg = await viewmodel.addDeliveryMethod(dmname: dmnameController.text, 
                      dmprice: double.parse(dmpriceController.text));
                      
                      if(msg==100){
                      Fluttertoast.showToast(
                        msg: "Error! Unable to add a new delivery method.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16,
                        backgroundColor: Color.fromARGB(255, 209, 68, 58),
                      );}
                      else{
                      Fluttertoast.showToast(msg: "New delivery method is successfully added!",
                          toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16,
                              backgroundColor: Color.fromARGB(255, 69, 161, 76),
                          );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryScreen()));
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