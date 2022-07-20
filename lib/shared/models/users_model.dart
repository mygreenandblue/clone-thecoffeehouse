class User {
  String? name;
  // ignore: non_constant_identifier_names
  String? phone_number;
  // ignore: non_constant_identifier_names
  String? date_of_birth;
  // ignore: non_constant_identifier_names
  String? image_path;
  String? account;
  String? password;
  String? passwordHash;
  String? mail;

  User(
      {this.name,
      // ignore: non_constant_identifier_names
      this.phone_number,
      // ignore: non_constant_identifier_names
      this.date_of_birth,
      // ignore: non_constant_identifier_names
      this.image_path,
      this.account,
      this.password,
      this.passwordHash,
      this.mail});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone_number = json['phone_number'];
    date_of_birth = json['date_of_birth'];
    image_path = json['image_path'];
    account = json['account'];
    password = json['password'];
    passwordHash = json['passwordHash'];
    mail = json['mail'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone_number'] = phone_number;
    data['date_of_birth'] = date_of_birth;
    data['image_path'] = image_path;
    data['account'] = account;
    data['password'] = password;
    data['passwordHash'] = passwordHash;
    data['mail'] = mail;
    return data;
  }
}
