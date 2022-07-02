import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superlaundry/models/orders.dart';

abstract class CurrStatusService {
  Stream<List<OrdersModel>> readStatus();
}
