import 'manageorder.dart';

class ManageOrderScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => ManageOrderScreen());

  @override
  ManageOrderScreenState createState() => ManageOrderScreenState();
}

class ManageOrderScreenState extends State<ManageOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ManageOrderAppBar(),
        body: ManageOrderBody(),
      ),
    );
  }
}
