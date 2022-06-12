import 'package:superlaundry/models/orders.dart';

abstract class ManageOrderService {
  Stream<List<OrdersModel>> readAllOrders();
  // Future<Map> readCustomerDetails();
  Future acceptOrder(String orderId);
  Future rejectOrder(String orderId);
  Future<String> getCustomerName(String userId);
  Future<String> getCustomerPhoneNum(String userId);
}
