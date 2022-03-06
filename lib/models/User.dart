class User {
  late String id;
  late String username;
  late String email;
  late String password;
  late String accessCode;

  User(this.id, this.username, this.email, this.password, this.accessCode);

  User.fromJson(Map json)
      : id = json['_id'],
        username = json['username'],
        email = json['email'],
        password = json['password'],
        accessCode = json['accessCode'];

  Map toJson() {
    return {
      'id': id,
      'name': username,
      'email': email,
      'password': password,
      'accessCode': accessCode
    };
  }
}
