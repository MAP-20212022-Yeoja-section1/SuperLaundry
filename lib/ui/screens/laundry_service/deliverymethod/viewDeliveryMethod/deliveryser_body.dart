import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/ui/screens/laundry_service/deliverymethod/addDeliveryMethod/addDeliveryMethod.dart';
import '../../../../../models/deliveryMethodModel.dart';
import '../viewDetailsDelivery/deliveryMethodDetails.dart';
import 'deliveryser_viewmodel.dart';

class DeliveryBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => DeliveryBody());

  @override
  _DeliveryBody createState() => _DeliveryBody();
}

class _DeliveryBody extends State<DeliveryBody> {
  @override
  Widget build(BuildContext Context) {
    return View<DeliveryViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Center(
                    child: Text(
                      "Delivery Method",
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
              StreamBuilder<List<DeliveryMethodModel>>(
                stream: viewmodel.readDeliveryMethods(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    final deliverymethods = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: deliverymethods.map(buildDeliveryMethod).toList(),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddDeliveryMethod()));
                  }, 
                  label: Text(
                    "Add delivery method",
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
    Widget buildDeliveryMethod(DeliveryMethodModel dm) => Card(
    shape:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(3),
    borderSide: BorderSide(color: Colors.white)
    ),
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: ListTile(
      title: Text(dm.dmName,
            style: TextStyle(
            fontSize: 18
            ),
          ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 32,
        color: Color.fromARGB(255, 17, 162, 126),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryMethodDetails(post: dm))),
    ),
    )
  );
}