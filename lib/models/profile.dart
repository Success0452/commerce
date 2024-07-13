class ProfileModel {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  ProfileModel(
      {this.id, this.email, this.password, this.name, this.role, this.avatar});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['role'] = role;
    data['avatar'] = avatar;
    return data;
  }
}
