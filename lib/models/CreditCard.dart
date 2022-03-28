import 'package:flutter/foundation.dart';
import 'package:save_my_pin/pages/card/componants/add_card_componants/credit_card.dart';

class CreditCard {
  late String cardNumber;
  late String expiryDate ;
  late String cardHolderName;
  late int cvvCode;
  late int pinNo;
  late String cardType;

  CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.pinNo,
    required this.cardType,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
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
