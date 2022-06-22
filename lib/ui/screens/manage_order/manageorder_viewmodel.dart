import 'manageorder.dart';

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
