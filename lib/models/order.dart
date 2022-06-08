import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String orderId;
  String date;
  String method;
  String userId;
  String time;

  OrderModel(
      {this.userId = "",
      this.orderId = "",
      this.method = "",
      this.date = "",
      this.time = ""});

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
      orderId: json["orderId"],
      method: json['method'],
      date: json['date'],
      userId: json['userId'],
      time: json['time']);

  Map<String, dynamic> toJson() {
    return {
      "orderId": orderId,
      "method": method,
      "date": date,
      "userId": userId,
      "time": time,
    };
  }
}
