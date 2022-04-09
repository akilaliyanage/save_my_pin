import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:save_my_pin/models/SecurePassword.dart';

class HttpServicePassword {
  //final String getUrl = "http://" + FlutterConfig.get('IP') + ":8000/product";

  Future<List<Password>> getPasswords(String userId) async {
    log(userId);

    Response res = await http
        .get(Uri.parse("http://localhost:8080/secPwd/get-pwd/" + userId));

    print(res);
    if (res.statusCode == 200) {
      //print(res.body);
      List<dynamic> body = jsonDecode(res.body);

      List<Password> products =
          body.map((dynamic item) => Password.fromJson(item)).toList();


      print(products[0].toString());
    print('passwoordssss----------,'+products.toString());


      return products;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get passwords";
    }
  }

  Future savePwd(String website, String username, String password) async {
    var dataMap = new Map<String, String>();
    dataMap['website'] = website;
    dataMap['username'] = username;
    dataMap['password'] = password;

    print(dataMap.toString());

    Response res = await http.post(
        Uri.parse("http://localhost:8080/secPwd/add-pwd"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'website': website,
          'username': username,
          'password': password,
        }));

    log(res.toString());
    if (res.statusCode == 200) {
      return true;
    } else {
      debugPrint('error');
      return false;
    }
  }

  Future<bool> delNote(String id) async {
    Response res = await http
        .delete(Uri.parse("http://localhost:8080/secPwd/delete/" + id));

    log(res.toString());
    if (res.statusCode == 200) {
      return true;
    } else {
      debugPrint('error');
      return false;
    }
  }

  Future<List<Password>> getSearchPasswords(String searchString) async {
    Response res = await get(
        Uri.parse("http://localhost:8000/secPwd/search/" + searchString));
    if (res.statusCode == 200) {
      log(res.body);
      List<dynamic> body = jsonDecode(res.body);

      List<Password> pwds =
          body.map((dynamic item) => Password.fromJson(item)).toList();

      return pwds;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get pwds";
    }
  }
}
