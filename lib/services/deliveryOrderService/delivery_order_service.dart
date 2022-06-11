import 'package:superlaundry/models/orders.dart';

abstract class DeliveryOrderManagementService {

  Stream<List<OrdersModel>> readAcceptedDeliveryOrder();
  Future updateStatusDelivery(String orderId, String orderStatus);
  Future<String> getCustomerName(String userId);
  Future<String> getCustomerPhoneNum(String userId);
  Future cancelDelivery(String orderId);

}