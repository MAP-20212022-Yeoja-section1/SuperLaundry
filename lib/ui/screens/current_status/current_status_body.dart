// ignore_for_file: non_constant_identifier_names

import 'current_status.dart';

class CurrStatusBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => CurrStatusBody());
  // final OrdersModel post;
  // CurrStatusBody({required this.post});
  @override
  _CurrStatusBodyState createState() => _CurrStatusBodyState();
}

class _CurrStatusBodyState extends State<CurrStatusBody> {
  @override
  Widget build(BuildContext Context) {
    return View<CurrStatusViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<OrdersModel>>(
                stream: viewmodel.readStatus(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final deliorders = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: deliorders.map(buildCurrStatus).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.red[700]),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget buildCurrStatus(OrdersModel os) => Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: Color.fromARGB(255, 31, 215, 169))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
            title: Text(
              "Order ID: " + os.orderId,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 17, 162, 126)),
            ),
            subtitle: Text(
              os.date + " | " + os.time,
              style: const TextStyle(
                fontSize: 16,
                height: 2.5,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right_rounded,
              size: 32,
              color: Color.fromARGB(255, 17, 162, 126),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CurrStatusDetails(post: os)));
            }),
      ));
}
