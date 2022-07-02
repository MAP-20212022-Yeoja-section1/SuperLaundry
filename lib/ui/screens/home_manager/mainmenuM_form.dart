import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/laundry_service/laundryser_screen.dart';
import 'package:superlaundry/ui/screens/change_status/change_status_screen.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_screen.dart';
import 'package:superlaundry/ui/screens/view_review/view_review_screen.dart';
import 'package:superlaundry/ui/screens/viewReport/overallReport/view_overall_report_screen.dart';

class mainMenuMForm extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => mainMenuMForm());

  @override
  _mainMenuMForm createState() => _mainMenuMForm();
}

class _mainMenuMForm extends State<mainMenuMForm> {
  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(50.0),
          child: GridView.count(crossAxisCount: 2, children: <Widget>[
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.text_snippet_outlined,
                        color: Color.fromARGB(255, 22, 135, 107),
                        size: 70.0,
                      ),
                      Text("View laundry Service Report",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LaundrySerScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.local_laundry_service_rounded,
                        color: Color.fromARGB(255, 22, 135, 107),
                        size: 70.0,
                      ),
                      Text("Manage Laundry Service",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageOrderScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        color: Color.fromARGB(255, 22, 135, 107),
                        size: 70.0,
                      ),
                      Text("Laundry Service Order",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewReviewScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.rate_review_outlined,
                        color: Color.fromARGB(255, 22, 135, 107),
                        size: 70.0,
                      ),
                      Text("View Customer Review",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeStatusScreen()));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.update,
                        color: Color.fromARGB(255, 22, 135, 107),
                        size: 70.0,
                      ),
                      Text("Update Laundry Status",
                          style: new TextStyle(fontSize: 17.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
            )
          ])),
    );
  }
}
