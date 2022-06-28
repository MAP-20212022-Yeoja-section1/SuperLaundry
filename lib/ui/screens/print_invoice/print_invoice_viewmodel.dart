import 'package:pdf/widgets.dart';
import 'package:superlaundry/services/print_invoice/print_invoice_service.dart';

import 'print_invoice.dart';

class PrintInvoiceViewModel extends Viewmodel {
  final LoginService _authService = locator<LoginService>();
  PrintInvoiceService get _printInvoiceService =>
      locator<PrintInvoiceService>();

  Stream<List<OrdersModel>> readActiveOrders() {
    return _printInvoiceService.readActiveOrders();
  }

  Future<File> saveDocument({
    @required name,
    @required pdf,
  }) async {
    return await _printInvoiceService.saveDocument(name, pdf);
  }

  Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  Future<File> generate({@required invoice}) async {
    return await _printInvoiceService.generate(invoice);
  }
}
