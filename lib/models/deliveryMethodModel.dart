class DeliveryMethodModel{
  String dmId;
  String dmName;
  double dmPrice;

  DeliveryMethodModel({this.dmId="", this.dmName="",this.dmPrice=0});

  static DeliveryMethodModel fromJson(Map<String, dynamic> json) => DeliveryMethodModel(
    dmId: json["deliveryMethodId"],
    dmName: json['deliveryMethodName'],
    dmPrice: json['deliveryMethodPrice']
  );

  Map<String, dynamic> toJson(){
    return {
      "deliveryMethodId" : dmId,
      "deliveryMethodName": dmName,
      "deliveryMethodPrice": dmPrice
    };
  }
}