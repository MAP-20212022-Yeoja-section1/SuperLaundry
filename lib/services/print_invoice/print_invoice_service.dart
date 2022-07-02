import 'dart:io';
import 'package:pdf/widgets.dart';
import '../../models/orders.dart';
import '../../models/invoice.dart';

abstract class PrintInvoiceService {
  Stream<List<OrdersModel>> readActiveOrders();
  Future<File> saveDocument(String name, Document pdf);
  Future openFile(File file);
  Future<File> generate(Invoice invoice);
}
