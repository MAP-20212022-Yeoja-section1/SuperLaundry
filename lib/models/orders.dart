import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersModel {
  String userId;
  String orderId;
  String deliveryMethod;
  String date;
  String time;
  String cleanMethod;
  String weight;
  String waterTemperature;
  String address;
  double totalPrice;
  String orderStatus;
  String statusTime;
  String paymentMethod;
  bool acceptedDelivery;
  String deliveryId;

  OrdersModel({
    this.userId = "",
    this.orderId = "",
    this.deliveryMethod = "",
    this.date = "",
    this.time = "",
    this.cleanMethod = "",
    this.weight = "",
    this.waterTemperature = "",
    this.address = "",
    this.totalPrice = 0.0,
    this.orderStatus = "",
    this.statusTime = "",
    this.paymentMethod = "",
    this.acceptedDelivery = false,
    this.deliveryId = ""
  });

  factory OrdersModel.fromMap(map) {
    return OrdersModel(
        userId: map["userId"],
        orderId: map["orderId"],
        deliveryMethod: map["deliveryMethod"],
        date: map["date"],
        time: map["time"],
        cleanMethod: map["cleanMethod"],
        weight: map["weight"],
        waterTemperature: map["waterTemperature"],
        address: map["address"],
        totalPrice: map["totalPrice"],
        orderStatus: map["orderStatus"],
        statusTime: map["statusTime"],
        paymentMethod: map['paymentMethod'],
        acceptedDelivery: map['acceptedDelivery'],
        deliveryId: map['deliveryId'] 
        );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "orderId": orderId,
      "deliveryMethod": deliveryMethod,
      "date": date,
      "time": time,
      "cleanMethod": cleanMethod,
      "weight": weight,
      "waterTemperature": waterTemperature,
      "address": address,
      "totalPrice": totalPrice,
      "orderStatus": orderStatus,
      "statusTime": statusTime,
      "paymentMethod": paymentMethod,
      "acceptedDelivery":acceptedDelivery,
      "deliveryId": deliveryId 
    };
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "orderId": orderId,
        "deliveryMethod": deliveryMethod,
        "date": date,
        "time": time,
        "cleanMethod": cleanMethod,
        "weight": weight,
        "waterTemperature": waterTemperature,
        "address": address,
        "totalPrice": totalPrice,
        "orderStatus": orderStatus,
        "statusTime": statusTime,
        "paymentMethod": paymentMethod,
        "acceptedDelivery":acceptedDelivery,
        "deliveryId": deliveryId     
      };

  static OrdersModel fromJson(Map<String, dynamic> json) => OrdersModel(
      userId: json['userId'],
      orderId: json['orderId'],
      deliveryMethod: json["deliveryMethod"],
      date: json["date"],
      time: json["time"],
      cleanMethod: json["cleanMethod"],
      weight: json["weight"],
      waterTemperature: json["waterTemperature"],
      address: json["address"],
      totalPrice: json["totalPrice"],
      orderStatus: json["orderStatus"],
      statusTime: json["statusTime"],
      paymentMethod: json['paymentMethod'],
      acceptedDelivery: json['acceptedDelivery'],
      deliveryId: json['deliveryId']     
    );
}
