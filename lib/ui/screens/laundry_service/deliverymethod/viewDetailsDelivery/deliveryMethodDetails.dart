import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/laundry_service/deliverymethod/viewDeliveryMethod/deliveryser_screen.dart';
import '../../../../../models/deliveryMethodModel.dart';
import '../editDeliveryMethod/editDeliveryMethod.dart';
import '../viewDeliveryMethod/deliveryser_viewmodel.dart';

class DeliveryMethodDetails extends StatefulWidget{

  final DeliveryMethodModel post;

  DeliveryMethodDetails({required this.post});

  @override
  DeliveryMethodDetailsState createState() => DeliveryMethodDetailsState();

}

class DeliveryMethodDetailsState extends State<DeliveryMethodDetails>{

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
        actions: <Widget>[
        FlatButton(
          child: Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditDeliveryMethodDetails(editpost: widget.post)));
          },
        ),
        ],
        ),
        body: Column(
            children: <Widget>[
              Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                        leading: Icon(Icons.label_important),
                        title: Text("Delivery method name: "+
                          widget.post.dmName,
                          style: TextStyle(fontSize: 18),
                          ),
                    ),
                  )
              ),
              Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.label_important),
                        title: Text("Delivery method price: RM " +
                           widget.post.dmPrice.toStringAsFixed(2),
                           style: TextStyle(fontSize: 18),
                          ),
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(top:20),
                  child: FloatingActionButton.extended(
                  onPressed: ()async {
                    showDialog(
                      context: context, 
                      builder: (context){
                        return AlertDialog(
                          elevation: 20,
                          title: Center(child: Text("Delete", style:TextStyle(color: Colors.red))),
                          content: Text("Are you sure you want to delete this item?",
                          textAlign: TextAlign.center,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Yes"),
                              onPressed: () async {
                                var msg = await viewmodel.deleteDeliveryMethod(dmid: widget.post.dmId);
                                if(msg==100){
                                Fluttertoast.showToast(
                                  msg: "Error! Unable to delete the delivery method.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  fontSize: 16,
                                  backgroundColor: Color.fromARGB(255, 209, 68, 58),
                                );}
                                else{
                                Fluttertoast.showToast(msg: "The delivery method is successfully deleted!",
                                    toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        fontSize: 16,
                                        backgroundColor: Color.fromARGB(255, 69, 161, 76),
                                    );
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryScreen()));
                                } 
                              }
                              ),
                              FlatButton(
                              child: Text("No"),
                              onPressed: (){
                                Navigator.of(context).pop();
                              }
                              )              
                          ],
                        );
                      }
                      );                                                     
                    },                   
                    label: Text(
                    'Delete',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
                    highlightElevation: 10.0,
                    backgroundColor: Color.fromARGB(255, 248, 40, 40),
              ),)
            ],
          ),
        )
      );
    }
}