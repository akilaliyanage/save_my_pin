import 'package:flutter/foundation.dart';

class SecureNote {
  late final String id;
  late final String noteName;
  late final String body;
  late final bool hasOptCode;
  late final String optPassCode;

  SecureNote({
    required this.id,
    required this.noteName,
    required this.body,
    required this.hasOptCode,
    required this.optPassCode,
  });

  factory SecureNote.fromJson(Map<String, dynamic> json) {
    return SecureNote(
        id: json['_id'],
        noteName: json['noteName'],
        body: json['body'],
        hasOptCode: json['hasOptCode'],
        optPassCode: json['optPassCode']);
  }
}
