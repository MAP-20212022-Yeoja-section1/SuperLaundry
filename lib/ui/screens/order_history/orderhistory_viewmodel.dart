import 'package:flutter/cupertino.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/services/orderhistory/orderhistory_service.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/app/service_locator.dart';

class OrderHistoryViewModel extends Viewmodel {
  final LoginService _authService = locator<LoginService>();
  OrderHistoryService get _orderHistoryService =>
      locator<OrderHistoryService>();

  // Future<Map<dynamic, dynamic>>? getOrder() async {
  //   return _orderHistoryService.getOrder();
  // }

  Future getCurrentID() async {
    return _authService.getCurrentUID();
  }

  Stream<List<OrdersModel>> readOrderHistory() {
    return _orderHistoryService.readOrderHistory();
  }
}
