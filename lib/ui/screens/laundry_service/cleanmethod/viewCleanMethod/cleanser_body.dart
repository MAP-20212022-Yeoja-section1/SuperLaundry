import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/addCleanMethod/addCleanMethod.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/viewDetailsClean/cleanMethodDetails.dart';
import 'cleanser_viewmodel.dart';

class CleanBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => CleanBody());

  @override
  _CleanBody createState() => _CleanBody();
}

class _CleanBody extends State<CleanBody> {

  @override
  Widget build(BuildContext Context) {
    return View<CleanViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) =>
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Center(
                    child: Text(
                      "Clean Method",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 17, 162, 126),
                        fontWeight: FontWeight.bold,
                        fontSize: 32,          
                        ),
                    ),
                  ),
                ),
              ),
              StreamBuilder<List<CleanMethodModel>>(
                stream: viewmodel.readCleanMethods(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    final cleanmethods = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: cleanmethods.map(buildCleanMethod).toList(),
                    );
                  }else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.red[700]
                          ),
                        ),
                      );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
              }
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: FloatingActionButton.extended(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCleanMethod()));
                  }, 
                  label: Text(
                    "Add clean method",
                    style: TextStyle(
                      fontSize: 18
                    ),
                    ),
                  backgroundColor: Color.fromARGB(255, 17, 162, 126),
                  icon: Icon(Icons.add),
                  ),
              )
            ],
          ),
        ),              
      );
  }

  Widget buildCleanMethod(CleanMethodModel cm) => Card(
    shape:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(3),
    borderSide: BorderSide(color: Colors.white)
    ),
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: ListTile(
      title: Text(cm.cmName,
            style: TextStyle(
            fontSize: 18
            ),
          ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 32,
        color: Color.fromARGB(255, 17, 162, 126),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CleanMethodDetails(post: cm))),
    ),
    )
  );
}