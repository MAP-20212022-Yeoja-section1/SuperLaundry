import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superlaundry/models/orders.dart';

abstract class CurrStatusService {
  Future<String> getStatus(String userId);
  Stream<List<OrdersModel>> readStatus();
}
