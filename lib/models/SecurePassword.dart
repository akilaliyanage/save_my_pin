import 'package:flutter/foundation.dart';

class Password {
  late final String website;
  late final String username;
  late final String password;
  late final DateTime date;

  Password({
    required this.website,
    required this.username,
    required this.password,
    required this.date,
  });

  factory Password.fromJson(Map<String, dynamic> json) {
    return Password(
        website: json['itemTitwebsitele'],
        username: json['username'],
        password: json['password'],
        date: json['date']);
  }
}
