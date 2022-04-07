import 'package:flutter/foundation.dart';
import 'package:save_my_pin/pages/card/componants/add_card_componants/credit_card.dart';

class CreditCard {
  late final String id;
  late final String cardNumber;
  late final String expiryDate ;
  late final String cardHolderName;
  late final int cvvCode;
  late final int pinNo;
  late final String cardType;

  CreditCard({
    required this.id,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.pinNo,
    required this.cardType,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
        id: json['_id'],
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
