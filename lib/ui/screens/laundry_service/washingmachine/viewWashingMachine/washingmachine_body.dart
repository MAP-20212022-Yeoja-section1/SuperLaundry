import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/ui/screens/laundry_service/washingmachine/addWashingMachine/addWashingMachine.dart';
import '../../../../../models/washingMachineModel.dart';
import '../viewDetailsWashingMachine/wachingMachineDetails.dart';
import 'washingmachine_viewmodel.dart';

class WashingMachineBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => WashingMachineBody());

  @override
  _WashingMachine createState() => _WashingMachine();
}

class _WashingMachine extends State<WashingMachineBody> {
  @override
  Widget build(BuildContext Context) {
    return View<WashingMachineViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) =>SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Center(
                    child: Text(
                      "Washing Machine",
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
              StreamBuilder<List<WashingMachineModel>>(
                stream: viewmodel.readWashingMachines(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    final washingmachines = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: washingmachines.map(buildWashingMachine).toList(),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddWashingMachine()));
                  }, 
                  label: Text(
                    "Add washing machine",
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
  
Widget buildWashingMachine(WashingMachineModel wm) => Card(
    shape:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(3),
    borderSide: BorderSide(color: Colors.white)
    ),
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: ListTile(
      title: Text(wm.wmWeight.toString() + " kg",
            style: TextStyle(
            fontSize: 18
            ),
          ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 32,
        color: Color.fromARGB(255, 17, 162, 126),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>WashingMachineDetails(post: wm))),
    ),
    )
  );
}