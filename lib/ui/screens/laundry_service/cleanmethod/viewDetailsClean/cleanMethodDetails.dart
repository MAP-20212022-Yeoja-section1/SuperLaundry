import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/editCleanMethod/editCleanMethod.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/viewCleanMethod/cleanser_screen.dart';

import '../viewCleanMethod/cleanser_viewmodel.dart';

class CleanMethodDetails extends StatefulWidget{

  final CleanMethodModel post;

  CleanMethodDetails({required this.post});

  @override
  CleanMethodDetailsState createState() => CleanMethodDetailsState();

}

class CleanMethodDetailsState extends State<CleanMethodDetails>{

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
        actions: <Widget>[
        FlatButton(
          child: Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditCleanMethodDetails(editpost: widget.post)));
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
                        title: Text("Clean method name: "+
                          widget.post.cmName,
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
                        title: Text("Clean method price: RM " +
                           widget.post.cmPrice.toStringAsFixed(2),
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
                                var msg = await viewmodel.deleteCleanMethod(cmid: widget.post.cmId);
                                if(msg==100){
                                Fluttertoast.showToast(
                                  msg: "Error! Unable to delete the clean method.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  fontSize: 16,
                                  backgroundColor: Color.fromARGB(255, 209, 68, 58),
                                );}
                                else{
                                Fluttertoast.showToast(msg: "The clean method is successfully deleted!",
                                    toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        fontSize: 16,
                                        backgroundColor: Color.fromARGB(255, 69, 161, 76),
                                    );
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> CleanScreen()));
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