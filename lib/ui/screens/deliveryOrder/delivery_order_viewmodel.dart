import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/service_locator.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/services/deliveryOrderService/delivery_order_service.dart';

class DeliveryOrderViewmodel extends Viewmodel {

  DeliveryOrderManagementService get _deliveryOrderManagementService => locator<DeliveryOrderManagementService>();

  Stream<List<OrdersModel>> readAcceptedDeliveryOrder(){
    return _deliveryOrderManagementService.readAcceptedDeliveryOrder();
  }

  Future updateStatusDelivery({@required orderId, @required orderStatus}) async{

    return await _deliveryOrderManagementService.updateStatusDelivery(orderId, orderStatus);

  }

  Future<String> getCustomerName(String userId) async {
    return await _deliveryOrderManagementService.getCustomerName(userId);
  }

  Future<String> getCustomerPhoneNum(String userId) async {
    return await _deliveryOrderManagementService.getCustomerPhoneNum(userId);
  }

  Future cancelDelivery(String orderId) async{
    return await _deliveryOrderManagementService.cancelDelivery(orderId);
  }
}