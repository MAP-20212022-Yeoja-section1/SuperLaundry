import '../../models/deliveryMethodModel.dart';

abstract class DeliveryManagementService {

  Future addDeliveryMethod(String dmname, double price);

  Stream<List<DeliveryMethodModel>> readDeliveryMethods();

  Future editDeliveryMethod(String dmid, String dmname, double price);

  Future deleteDeliveryMethod(String dmid);
}