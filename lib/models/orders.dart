import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersModel {
  String orderId;
  String deliveryMethod;
  String date;
  String time;
  String cleanMethod;
  String weight;
  String waterTemperature;
  String address;
  double totalPrice;

  OrdersModel(
      {this.orderId = "",
      this.deliveryMethod = "",
      this.date = "",
      this.time = "",
      this.cleanMethod = "",
      this.weight = "",
      this.waterTemperature = "",
      this.address = "",
      this.totalPrice = 0.0});

  factory OrdersModel.fromMap(map) {
    return OrdersModel(
        orderId: map["orderId"],
        deliveryMethod: map["deliveryMethod"],
        date: map["date"],
        time: map["time"],
        cleanMethod: map["cleanMethod"],
        weight: map["weight"],
        waterTemperature: map["waterTemperature"],
        address: map["address"],
        totalPrice: map["totalPrice"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "orderId": orderId,
      "deliveryMethod": deliveryMethod,
      "date": date,
      "time": time,
      "cleanMethod": cleanMethod,
      "weight": weight,
      "waterTemperature": waterTemperature,
      "address": address,
      "totalPrice": totalPrice,
    };
  }

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "deliveryMethod": deliveryMethod,
        "date": date,
        "time": time,
        "cleanMethod": cleanMethod,
        "weight": weight,
        "waterTemperature": waterTemperature,
        "address": address,
        "totalPrice": totalPrice,
      };

  static OrdersModel fromJson(Map<String, dynamic> json) => OrdersModel(
      orderId: json['orderId'],
      deliveryMethod: json["deliveryMethod"],
      date: json["date"],
      time: json["time"],
      cleanMethod: json["cleanMethod"],
      weight: json["weight"],
      waterTemperature: json["waterTemperature"],
      address: json["address"],
      totalPrice: json["totalPrice"]);
}
