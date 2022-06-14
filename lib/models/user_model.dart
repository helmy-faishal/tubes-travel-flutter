class UserModel{
  String? username;
  String? email;
  String? token;

  UserModel({
    this.username,
    this.email,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    email = json['email'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson(){
    return {
      'username' : username,
      'email' : email,
      'token' : token,
    };
  }
}