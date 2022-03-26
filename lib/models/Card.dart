import 'package:flutter/foundation.dart';

class Card {
  late String cardNumber;
  late String expiryDate ;
  late String cardHolderName;
  late int cvvCode;
  late int pinNo;
  late String cardType;

  Card({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.pinNo,
    required this.cardType,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
        cardNumber: json['cardNumber'],
        expiryDate: json['expiryDate'],
        cardHolderName: json['cardHolderName'],
        cvvCode: json['cvvCode'],
        cardType: json['cardType'],
        pinNo: json['pinNo']);
  }

  Map<String, dynamic> toJson() => {
    'cardNumber': cardNumber,
    'expiryDate': expiryDate,
    'cardHolderName': cardHolderName,
    'cvvCode': cvvCode,
    'cardType': cardType,
    'pinNo': pinNo
  };
}
