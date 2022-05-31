import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';
import '../../../models/orders.dart';
import '../../../app/service_locator.dart';
import '../../../services/add_order/add_order_service.dart';

class AddOrderViewmodel extends Viewmodel {
  AddOrderService get _addOrderService => locator<AddOrderService>();
  double totalPrice = 0.0;
  double washingMachinePrice = 0.0;

  Future getWashingMachinePrice(
      {@required weight, @required waterTemperature}) async {
    washingMachinePrice =
        await _addOrderService.getWashingMachinePrice(weight, waterTemperature);
    return washingMachinePrice;
  }

  Future calcTotalPrice(
      {@required deliveryMethodPrice,
      @required cleanMethodPrice,
      @required weight,
      @required waterTemperature}) async {
    totalPrice = await _addOrderService.calcTotalPrice(
        deliveryMethodPrice, cleanMethodPrice, weight, waterTemperature);
    return totalPrice;
  }

  Future createOrder(
      {@required deliveryMethod,
      @required date,
      @required time,
      @required cleanMethod,
      @required weight,
      @required waterTemperature,
      @required address,
      @required totalPrice}) async {
    try {
      final docOrders = FirebaseFirestore.instance.collection('orders').doc();
      final ordersModel = OrdersModel(
        orderId: docOrders.id,
        deliveryMethod: deliveryMethod,
        date: date,
        time: time,
        cleanMethod: cleanMethod,
        weight: weight,
        waterTemperature: waterTemperature,
        address: address,
        totalPrice: totalPrice,
      );

      final map = ordersModel.toJson();
      await docOrders.set(map);
      return 200;
    } on Exception catch (e) {
      return 101;
    }
  }

  Stream<List<CleanMethodModel>> readCleanMethods() {
    return _addOrderService.readCleanMethods();
  }
}
