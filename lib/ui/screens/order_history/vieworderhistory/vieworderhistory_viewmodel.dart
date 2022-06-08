// import 'package:map_mvvm/map_mvvm.dart';
// import 'package:map_mvvm/viewmodel.dart';
// import 'package:superlaundry/models/order.dart';
// import 'package:superlaundry/services/orderhistory/orderhistory_service.dart';
// import 'package:superlaundry/services/registration/login_service.dart';
// import 'package:superlaundry/app/service_locator.dart';

// class ViewOrderHistoryViewModel extends Viewmodel {
//   final LoginService _authService = locator<LoginService>();
//   OrderHistoryService get _orderHistoryService =>
//       locator<OrderHistoryService>();

//   // Future<Map> getOrderDetails() async {
//   //   return await _orderHistoryService.getOrderDetails();
//   // }

//   Stream<List<OrderModel>> readOrderHistory() {
//     return _orderHistoryService.readOrderHistory();
//   }

//   Future getCurrentID() async {
//     return _authService.getCurrentUID();
//   }
// }
