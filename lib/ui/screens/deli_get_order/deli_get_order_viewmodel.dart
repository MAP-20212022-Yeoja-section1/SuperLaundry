// ignore_for_file: camel_case_types, unused_element

import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/service_locator.dart';
import '../../../../../models/orders.dart';
import 'package:superlaundry/services/deliOrder/deliOrder_service.dart';
import 'package:superlaundry/services/profile_edit/profile_service.dart';

class deliOrderViewmodel extends Viewmodel {
  DeliOrderService get _deliOrderService => locator<DeliOrderService>();
  final ProfileService _profileService = locator<ProfileService>();

  Stream<List<OrdersModel>> readDeliOrder() {
    return _deliOrderService.readDeliOrder();
  }

  Future<Map<dynamic, dynamic>>? getUserData() async {
    return _profileService.getUserData();
  }

  Future<String> getCustName(String userId) async {
    return await _deliOrderService.getCustName(userId);
  }

  Future<String> getCustPNo(String userId) async {
    return await _deliOrderService.getCustPNo(userId);
  }

  Future updateDelivery({@required orderId}) async {
    return await _deliOrderService.updateDelivery(orderId);
  }
}
