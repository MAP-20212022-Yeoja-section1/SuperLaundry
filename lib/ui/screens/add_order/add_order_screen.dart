import 'add_order.dart';

class AddOrderScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => AddOrderScreen());
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AddOrderAppBar(),
        body: AddOrderBody(),
      ),
    );
  }
}
