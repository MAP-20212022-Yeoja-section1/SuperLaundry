import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/viewCleanMethod/cleanser_screen.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/viewDetailsClean/cleanMethodDetails.dart';
import '../../../../../models/deliveryMethodModel.dart';
import '../viewDeliveryMethod/deliveryser_screen.dart';
import '../viewDeliveryMethod/deliveryser_viewmodel.dart';
import '../viewDetailsDelivery/deliveryMethodDetails.dart';

class EditDeliveryMethodDetails extends StatefulWidget{

  final DeliveryMethodModel editpost;

  EditDeliveryMethodDetails({required this.editpost});

  @override
  EditDeliveryMethodDetailsState createState() => EditDeliveryMethodDetailsState();

}

class EditDeliveryMethodDetailsState extends State<EditDeliveryMethodDetails>{

  final _formKey = GlobalKey<FormState>();

  TextEditingController dmnameController = new TextEditingController();
  TextEditingController dmpriceController = new TextEditingController();
  
  @override
  void initState() {
    super.initState();
    dmnameController.text = widget.editpost.dmName;
    dmpriceController.text = widget.editpost.dmPrice.toStringAsFixed(2);
  }

    @override   
    Widget build(BuildContext context){
        return View<DeliveryViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
        appBar: AppBar(
        title: Text('LAUNDRY SERVICE'),
        leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryMethodDetails(post: widget.editpost)));
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
                    decoration: const InputDecoration(labelText: 'Delivery method price'),
                    validator: (value){
                      if (dmpriceController.text.isEmpty){
                        return "Enter the delivery method price!";
                      }
                      return null;
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
                      
                      var msg = await viewmodel.editDeliveryMethod(dmid: widget.editpost.dmId, dmname: dmnameController.text, 
                      dmprice: double.parse(dmpriceController.text));
                      
                      if(msg==100){
                      Fluttertoast.showToast(
                        msg: "Eror! Unable to update the delivery method.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16,
                        backgroundColor: Color.fromARGB(255, 209, 68, 58),
                      );}
                      else{
                      Fluttertoast.showToast(msg: "The delivery method is successfully updated!",
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
                  'Update',
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