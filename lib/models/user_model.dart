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

  UserModel.fromModel(UserModel user){
    username = user.username;
    email = user.email;
    token = user.token;
  }

  UserModel updateFromJson(Map<String, dynamic> json){
    username = json['username'];
    return this;
  }

  Map<String, dynamic> toJson(){
    return {
      'username' : username,
      'email' : email,
      'token' : token,
    };
  }
}