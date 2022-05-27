class CleanMethodModel{
  String cmId;
  String cmName;
  double cmPrice;

  CleanMethodModel({this.cmId="", this.cmName="",this.cmPrice=0});

  static CleanMethodModel fromJson(Map<String, dynamic> json) => CleanMethodModel(
    cmId: json["cleanMethodId"],
    cmName: json['cleanMethodName'],
    cmPrice: json['cleanMethodPrice']
  );

  Map<String, dynamic> toJson(){
    return {
      "cleanMethodId" : cmId,
      "cleanMethodName": cmName,
      "cleanMethodPrice": cmPrice
    };
  }
}