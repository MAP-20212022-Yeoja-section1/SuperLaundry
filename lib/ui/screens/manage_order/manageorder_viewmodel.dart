import 'package:map_mvvm/map_mvvm.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/services/manage_order/manage_order_service.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/app/service_locator.dart';
import 'package:meta/meta.dart';
import '../../../../../models/orders.dart';
import '../../../services/registration/login_service.dart';

class ManageOrderViewModel extends Viewmodel {
  final LoginService _authService = locator<LoginService>();
  ManageOrderService get _manageOrderService => locator<ManageOrderService>();

  // Future<Map<dynamic, dynamic>>? getOrder() async {
  //   return _orderHistoryService.getOrder();
  // }

  Future getCurrentID() async {
    return _authService.getCurrentUID();
  }

  Stream<List<OrdersModel>> readAllOrders() {
    return _manageOrderService.readAllOrders();
  }

  Future acceptOrder({@required orderId}) async {
    return await _manageOrderService.acceptOrder(orderId);
  }

  Future rejectOrder({@required orderId}) async {
    return await _manageOrderService.rejectOrder(orderId);
  }

  Future<String> getCustomerName(String userId) async {
    return await _manageOrderService.getCustomerName(userId);
  }

  Future<String> getCustomerPhoneNum(String userId) async {
    return await _manageOrderService.getCustomerPhoneNum(userId);
  }
}
