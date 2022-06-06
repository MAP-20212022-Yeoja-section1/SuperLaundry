import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/failures.dart';
import '../../../models/orders.dart';
import '../../../app/service_locator.dart';
import '../../../services/change_status/change_status_service.dart';
import '../../../app/failures.dart';

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
