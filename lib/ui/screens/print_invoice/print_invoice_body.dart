import 'print_invoice.dart';

class PrintInvoiceBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => PrintInvoiceBody());

  @override
  _printInvoiceBodyState createState() => _printInvoiceBodyState();
}

class _printInvoiceBodyState extends State<PrintInvoiceBody> {
  @override
  Widget build(BuildContext context) {
    return View<PrintInvoiceViewModel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<OrdersModel>>(
                stream: viewmodel.readActiveOrders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final order = snapshot.data!;
                    return Row(children: <Widget>[
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: order.map((order) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(11, 181, 142, 100),
                                    )),
                                margin:
                                    EdgeInsets.fromLTRB(22.0, 1.0, 20.0, 2.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                      title: Text(
                                        'Order ID: ' + order.orderId,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      subtitle:
                                          Text(order.date + " | " + order.time),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PrintInvoice2Body(
                                                          post: order)));
                                        },
                                        icon: Icon(Icons.chevron_right_sharp),
                                        iconSize: 35.0,
                                        color:
                                            Color.fromRGBO(11, 181, 142, 100),
                                      )),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
