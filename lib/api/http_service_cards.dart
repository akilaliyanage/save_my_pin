import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:save_my_pin/models/CreditCard.dart';
import 'dart:developer';

import '../auth/Auth.dart';
import '../utils/connection.dart';

class HttpServiceCard {

  Future<List<CreditCard>> getCards() async {
    String userId =  await Auth.getUserId();
    Response res =
    await get(Uri.parse(Connection.baseUrl + "/secCard/get-cards/" + userId));

    //print(res.toString());
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<CreditCard> cards =
      body.map((dynamic item) => CreditCard.fromJson(item)).toList();

      return cards;
    } else {
      debugPrint('error');
      log('cant fetch data');
      throw "cant get cards";
    }
  }

  Future<CreditCard> getCard(String cardNo) async {
    //print(userId);

    Response res =
    await get(Uri.parse(Connection.baseUrl + "/secCard/get-cards/" + cardNo));

    //print(res.toString());
    if (res.statusCode == 200) {
      //print(res.body);
      dynamic body = jsonDecode(res.body);

      CreditCard card =
      body.map((dynamic item) => CreditCard.fromJson(item));

      return card;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get cards";
    }
  }

  Future addCard(CreditCard card, String adminId) async {
    print("called");
    var res = await post(Uri.parse(Connection.baseUrl + "/secCard/add-card"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'cardNumber': card.cardNumber,
          'expiryDate': card.expiryDate,
          'cardHolderName': card.cardHolderName,
          'cvvCode': card.cvvCode.toString(),
          'cardType': card.cardType,
          'pinNo': card.pinNo.toString(),
          'userId': adminId,
        }));
    var result = jsonDecode(res.body);
    print(result['status']);
    if (result['status'] == 201) {
      print("Success");
    } else if (result['status'] == 401) {
      print("Already Exist");
    } else {
      print("Something went wrong");
    }
    return true;
  }

}
