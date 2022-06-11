import 'package:superlaundry/models/orders.dart';

abstract class DeliveryOrderManagementService {

  Stream<List<OrdersModel>> readAcceptedDeliveryOrder();
  Future updateStatusDelivery(String orderId, String orderStatus);

}