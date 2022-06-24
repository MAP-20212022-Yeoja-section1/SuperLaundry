import '../view_report.dart';

class ChosenMonthlyReportBody extends StatefulWidget {
  
  late final String month;
  late final String year;

  ChosenMonthlyReportBody({required this.month,required this.year});

  @override
  _ChosenMonthlyReportBody createState() => _ChosenMonthlyReportBody();
}

class _ChosenMonthlyReportBody extends State<ChosenMonthlyReportBody> {

  @override
  Widget build(BuildContext context) {
    return View<ReportViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) =>Scaffold(
        appBar: ReportAppBar(),
        body: Stack(
        children: <Widget>[
        Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 167, 255, 235)),
        ),
        Center(
            child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:18),
              child: Row(
                children: <Widget>[
                  TextButton(
                    child: Text('Overall'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromARGB(255, 25, 99, 78),
                      side: BorderSide(width: 1.0, color: Colors.white),
                      fixedSize: Size(80,30)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportScreen()));
                    },
                  ),
                  TextButton(
                    child: Text('Monthly'),
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 25, 99, 78),
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 1.0, color: Colors.white),
                      fixedSize: Size(80,30)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyReportScreen()));
                    },
                  ),
                  TextButton(
                    child: Text('Yearly'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromARGB(255, 25, 99, 78),
                      side: BorderSide(width: 1.0, color: Colors.white),
                      fixedSize: Size(80,30)
                    ),
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YearlyReportScreen()));
                    },
                  ),
                ]
              ),
            ),
            Container(
                  height: 530,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 217, 255, 245),
                    borderRadius: BorderRadius.all(const Radius.circular(10)),
                    boxShadow: const [ BoxShadow(color: Colors.grey, blurRadius: 2.0, offset: Offset(2.0, 2.0))],
                  ),
                  padding: const EdgeInsets.only(left: 28.0, top: 20.0, right: 28.0),
                  child:Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: viewmodel.readMonthlyTotalOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                              padding: const EdgeInsets.only(bottom:10.0),
                              child: Align(alignment: Alignment.centerLeft,child:Text("No. of received orders: "+ snapshot.data.toString())),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthlyCompletedOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                              padding: const EdgeInsets.only(bottom:10.0),
                              child: Align(alignment: Alignment.centerLeft,child:Text("No. of completed orders: "+ snapshot.data.toString())),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthlyRejectedOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                              padding: const EdgeInsets.only(bottom:10.0),
                              child: Align(alignment: Alignment.centerLeft,child:Text("No. of rejected orders: "+ snapshot.data.toString())),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        Divider(thickness: 1, color: Colors.grey, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Text("Cleaning Method", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthlyWashOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("Wash only order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthlyWashDryOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("Wash and dry order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthlyWashDryFoldOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("Wash, dry and fold order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        Divider(thickness: 1, color: Colors.grey, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Text("Delivery Method", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthlyPickUpOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("Pick up only order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthlyBothOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("Pick up and delivery order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        Divider(thickness: 1, color: Colors.grey, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Text("Washing Machine", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthly9kgOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("9 kg order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthly14kgOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("14 kg order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        FutureBuilder(
                        future: viewmodel.readMonthly25kgOrders(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:10.0),
                                child: Align(alignment: Alignment.centerLeft,child:Text("25 kg order(s): "+ snapshot.data.toString()),
                            ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                        Divider(thickness: 1, color: Colors.grey, height: 20),
                        FutureBuilder(
                        future: viewmodel.readMonthlyTotalSales(widget.month,widget.year),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                                padding: const EdgeInsets.only(bottom:20, top: 10),
                                child: Text("Total sales: RM "+ snapshot.data.toString(),
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 25, 99, 78),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                          ),
                                  ),
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
                            return Center(child: Text("loading..."));
                          }
                        }
                        ),
                                          
                    ],
                  )),             
          ]),
        )),                
        ]),
      )
    );
  }
}