class WashingMachineModel{
  String wmId;
  double wmWeight;
  double wmCold;
  double wmWarm;
  double wmHot;

  WashingMachineModel({this.wmId="", this.wmWeight=0,this.wmCold=0, this.wmWarm=0, this.wmHot=0});

  static WashingMachineModel fromJson(Map<String, dynamic> json) => WashingMachineModel(
    wmId: json["wmId"],
    wmWeight: json['wmWeight'],
    wmCold: json['wmCold'],
    wmWarm: json['wmWarm'],
    wmHot: json['wmHot'],
  );

  Map<String, dynamic> toJson(){
    return {
      "wmId" : wmId,
      "wmWeight": wmWeight,
      "wmCold": wmCold,
      "wmWarm": wmWarm,
      "wmHot": wmHot,
    };
  }
}