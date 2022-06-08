import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/washingMachineModel.dart';
import 'package:superlaundry/ui/screens/laundry_service/washingmachine/viewWashingMachine/washingmachine_screen.dart';

import '../editWashingMachine/deleteWashingMachine/editWashingMachine.dart';
import '../viewWashingMachine/washingmachine_viewmodel.dart';

class WashingMachineDetails extends StatefulWidget{

  final WashingMachineModel post;

  WashingMachineDetails({required this.post});

  @override
  WashingMachineDetailsState createState() => WashingMachineDetailsState();

}

class WashingMachineDetailsState extends State<WashingMachineDetails>{

    @override   
    Widget build(BuildContext context){
      var view = View<WashingMachineViewmodel>(
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
        actions: <Widget>[
        FlatButton(
          child: Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditWashingMachineDetails(editpost: widget.post)));
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
                        title: Text("Washing machine weight: "+
                          widget.post.wmWeight.toString() + " kg",
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
                        title: Text("Cold water: RM " +
                           widget.post.wmCold.toStringAsFixed(2),
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
                        title: Text("Warm water: RM " +
                           widget.post.wmWarm.toStringAsFixed(2),
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
                        title: Text("Hot water: RM " +
                           widget.post.wmHot.toStringAsFixed(2),
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
                                dynamic msg = await viewmodel.deleteWashingMachine(wmid: widget.post.wmId);
                                if(msg==100){
                                Fluttertoast.showToast(
                                  msg: "Error! Unable to delete the washing machine.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  fontSize: 16,
                                  backgroundColor: Color.fromARGB(255, 209, 68, 58),
                                );}
                                else{
                                Fluttertoast.showToast(msg: "The washing machine is successfully deleted!",
                                    toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        fontSize: 16,
                                        backgroundColor: Color.fromARGB(255, 69, 161, 76),
                                    );
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> WashingMachineScreen()));
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
      return view;
    }
}