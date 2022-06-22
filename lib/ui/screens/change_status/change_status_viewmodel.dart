import 'change_status.dart';

class ChangeStatusViewmodel extends Viewmodel {
  ChangeStatusService get _changeStatusService =>
      locator<ChangeStatusService>();

  Stream<List<OrdersModel>> readActiveOrders() {
    return _changeStatusService.readActiveOrders();
  }

  Future updateStatus(
      {@required orderStatus, @required statusTime, @required orderId}) async {
    return await _changeStatusService.updateStatus(
        orderStatus, statusTime, orderId);
  }
}
