// ignore_for_file: camel_case_types

import 'package:map_mvvm/map_mvvm.dart';
import 'package:superlaundry/app/service_locator.dart';
import '../../../../../models/orders.dart';
import 'package:superlaundry/services/deliOrder/deliOrder_service.dart';
import 'package:superlaundry/services/profile_service.dart';
import '../../../services/registration/login_service.dart';

class deliOrderViewmodel extends Viewmodel {
  // DeliveryOrderService get _DeliveryOrderService => locator<DeliveryOrderService>();
  DeliOrderService get _deliOrderService => locator<DeliOrderService>();
  final ProfileService _profileService = locator<ProfileService>();
  final LoginService _loginService = locator<LoginService>();

  Stream<List<OrdersModel>> readDeliOrder() {
    return _deliOrderService.readDeliOrder();
  }

  Stream<List<OrdersModel>> readDeliUser() {
    return _deliOrderService.readDeliOrder();
  }

  Future<Map<dynamic, dynamic>>? getUserData() async {
    return _profileService.getUserData();
  }

  Future getCurrentID() async {
    return _loginService.getCurrentUID();
  }
}
