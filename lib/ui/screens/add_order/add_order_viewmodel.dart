import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/failures.dart';
import 'package:superlaundry/models/cleanMethodModel.dart';
import '../../../models/orders.dart';
import '../../../app/service_locator.dart';
import '../../../services/add_order/add_order_service.dart';
import '../../../app/failures.dart';

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

  Future getAddress() async {
    var address;
    address = await _addOrderService.getAddress().toString();
    return address;
  }

  Future createOrder(
      {@required deliveryMethod,
      @required date,
      @required time,
      @required cleanMethod,
      @required weight,
      @required waterTemperature,
      @required address,
      @required totalPrice,
      @required orderStatus,
      @required statusTime,
      @required paymentMethod}) async {
    await _addOrderService.createOrder(
        deliveryMethod,
        date,
        time,
        cleanMethod,
        weight,
        waterTemperature,
        address,
        totalPrice,
        orderStatus,
        statusTime,
        paymentMethod);
    return Failures;
  }

  Stream<List<CleanMethodModel>> readCleanMethods() {
    return _addOrderService.readCleanMethods();
  }
}
