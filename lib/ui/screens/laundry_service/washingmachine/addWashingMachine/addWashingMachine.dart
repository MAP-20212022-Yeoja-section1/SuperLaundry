import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import '../viewWashingMachine/washingmachine_screen.dart';
import '../viewWashingMachine/washingmachine_viewmodel.dart';


class AddWashingMachine extends StatefulWidget{

  @override
  AddWashingMachineState createState() => AddWashingMachineState();

}

class AddWashingMachineState extends State<AddWashingMachine>{

  final _formKey = GlobalKey<FormState>();
  final wmWeightController = TextEditingController();
  final wmColdController = TextEditingController();
  final wmWarmController = TextEditingController();
  final wmHotController = TextEditingController();

    @override   
    Widget build(BuildContext context){
      return View<WashingMachineViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => Scaffold(
        appBar: AppBar(
        title: Text('LAUNDRY SERVICE'),
        leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WashingMachineScreen()));
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
                    controller: wmWeightController,
                    decoration: const InputDecoration(labelText: 'Washing Machine Weight'),
                    validator: (value){
                      if (wmWeightController.text.isEmpty){
                        return "Enter the washing machine weight!";
                      }
                      return null;
                    },
                    onSaved: (value){
                            wmWeightController.text = value!;
                          },
                    
                  ),
                  TextFormField(
                    controller: wmColdController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                    decoration: const InputDecoration(labelText: 'Cold water price'),
                    validator: (value){
                      if (wmColdController.text.isEmpty){
                        return "Enter cold water price!";
                      }else{return null;}
                    },
                    onSaved: (value){
                            wmColdController.text = value!;
                          },
                    
                  ),
                  TextFormField(
                    controller: wmWarmController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                    decoration: const InputDecoration(labelText: 'Warm water price'),
                    validator: (value){
                      if (wmWarmController.text.isEmpty){
                        return "Enter warm water price!";
                      }else{return null;}
                    },
                    onSaved: (value){
                            wmWarmController.text = value!;
                          },
                    
                  ),
                  TextFormField(
                    controller: wmHotController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                    decoration: const InputDecoration(labelText: 'Hot water price'),
                    validator: (value){
                      if (wmHotController.text.isEmpty){
                        return "Enter hot water price!";
                      }else{return null;}
                    },
                    onSaved: (value){
                            wmHotController.text = value!;
                          },
                    
                  ),
                  Padding(
                  padding: EdgeInsets.only(top:20),
                  child: FloatingActionButton.extended(
                  onPressed: ()async {
                    if (_formKey.currentState!.validate()){
                      
                      dynamic msg = await viewmodel.addWashingMachine(weight: double.parse(wmWeightController.text),
                      cold: double.parse(wmColdController.text),warm: double.parse(wmWarmController.text),
                      hot: double.parse(wmHotController.text));
                      
                      if(msg==100){
                      Fluttertoast.showToast(
                        msg: "Error! Unable to add a new washing machine",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16,
                        backgroundColor: Color.fromARGB(255, 209, 68, 58),
                      );}
                      else{
                      Fluttertoast.showToast(msg: "New washing machine is successfully added!",
                          toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16,
                              backgroundColor: Color.fromARGB(255, 69, 161, 76),
                          );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> WashingMachineScreen()));
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