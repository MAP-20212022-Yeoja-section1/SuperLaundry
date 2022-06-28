import 'print_invoice.dart';

class PrintInvoiceScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => PrintInvoiceScreen());

  @override
  _printInvoiceScreenState createState() => _printInvoiceScreenState();
}

class _printInvoiceScreenState extends State<PrintInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PrintInvoiceAppBar(),
        body: PrintInvoiceBody(),
      ),
    );
  }
}
