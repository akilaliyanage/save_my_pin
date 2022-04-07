import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:save_my_pin/models/CreditCard.dart';
import 'package:save_my_pin/pages/card/card_details.dart';
import 'dart:developer';
import 'package:save_my_pin/pages/card/my_cards.dart';
import '../auth/Auth.dart';
import '../utils/connection.dart';

class HttpServiceCard {

  Future<List<CreditCard>> getCards() async {
    String userId =  await Auth.getUserId();
    Response res =
    await get(Uri.parse(Connection.baseUrl + "/secCard/get-cards/" + userId));


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

  Future getCard(BuildContext context, String id) async {
    //print(userId);

    Response res =
    await get(Uri.parse(Connection.baseUrl + "/secCard/get-card/" + id));

    //print(res.toString());
    if (res.statusCode == 200) {
      Map<String , dynamic> body = jsonDecode(res.body);

      CreditCard card = CreditCard.fromJson(body);
      print("body Is : " + res.body);
      //Navigator.pushNamed(context, CardDetails.routeName);
      Navigator.push( context, MaterialPageRoute( builder: (context) => CardDetails(creditCard: card)));
    } else {
      debugPrint('error');
      log('cant fetch data');
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

  Future deleteCard(BuildContext context,String id) async {
    var res = await delete(
        Uri.parse(Connection.baseUrl + "/secCard/delete-card/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        });
    var result = jsonDecode(res.body);
    if (result['status'] == 200) {
      print("Deleted");
      Navigator.pushNamed(context, my_cards.routeName);
    } else {
      print("Error in Deleted");
    }
  }

  Future updatePin(String id, String pin, BuildContext context) async {
    print('called update');
    print('id : ' + id + ": Pin : " + pin);
    Response res = await patch(
        Uri.parse(Connection.baseUrl + '/secCard/update-pin/' + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{'pin': pin}));

    if (res.statusCode == 200) {
      print('success update');
      Map<String , dynamic> body = jsonDecode(res.body);

      CreditCard card = CreditCard.fromJson(body);
      print("body Is : " + res.body);
      //Navigator.pushNamed(context, CardDetails.routeName);
      Navigator.push( context, MaterialPageRoute( builder: (context) => CardDetails(creditCard: card)));
    } else {
      print('false');
      log('Error in updating pin');
      throw "Error in updating pin";
    }
  }

}
