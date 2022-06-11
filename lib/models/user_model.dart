class UserModel{
  String? username;
  String? email;
  String? password;

  UserModel({
    this.username,
    this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson(){
    return {
      'username' : username,
      'email' : email,
      'password' : password,
    };
  }
}