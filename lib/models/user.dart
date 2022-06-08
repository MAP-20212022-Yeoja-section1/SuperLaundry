class UserModel {
  String userId;
  String name;
  String phonenum;
  String homeaddress;
  String email;
  String password;
  String role;

  UserModel(
      {this.userId = "",
      this.name = "",
      this.phonenum = "",
      this.homeaddress = "",
      this.email = "",
      this.password = "",
      this.role = ""});

  factory UserModel.fromMap(map) {
    return UserModel(
        userId: map["userId"],
        name: map["name"],
        phonenum: map["phonenum"],
        homeaddress: map["homeaddress"],
        email: map["email"],
        password: map["password"],
        role: map["role"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "name": name,
      "phonenum": phonenum,
      "homeaddress": homeaddress,
      "email": email,
      "password": password,
      "role": role
    };
  }
}
