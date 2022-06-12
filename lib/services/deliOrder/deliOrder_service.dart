// ignore_for_file: file_names

import 'package:superlaundry/models/orders.dart';

abstract class DeliOrderService {
  Stream<List<OrdersModel>> readDeliOrder();
  Future updateDelivery(String orderId);
  Future<String> getCustName(String userId);
  Future<String> getCustPNo(String userId);
}
