class UserDetails{
  late String id;
  late String username;
  late String email;
  late int phoneNo;
  late bool isActive;

  UserDetails.fromJson(Map<String,dynamic> json){
    id = json["_id"];
    username = json["userName"];
    email = json["email"];
    phoneNo = json["contact"];
    isActive = json["isActive"];
  }
}

class User{
  late String token;
  late UserDetails userDetails;

  User.fromJson(Map<String,dynamic> json){
    token = json["token"];
    userDetails = UserDetails.fromJson(json["user"]);
  }
}

