import 'current_status.dart';

class CurrStatusScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => CurrStatusScreen());

  @override
  CurrStatusScreenState createState() => CurrStatusScreenState();
}

class CurrStatusScreenState extends State<CurrStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CurrStatusAppBar(),
        body: CurrStatusBody(),
      ),
    );
  }
}
