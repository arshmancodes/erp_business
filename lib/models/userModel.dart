class UserModel {
  int? id;
  String? username;
  String? password;
  String? email;
  String? name;

  UserModel({
    this.email,
    this.id,
    this.name,
    this.password,
    this.username,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    name = json['name'];
  }
}
