import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:flutter_config/flutter_config.dart';
import 'package:save_my_pin/models/SecurePassword.dart';

class HttpServicePassword {
  final String getUrl = "http://" + FlutterConfig.get('IP') + ":8000/product";

  Future<List<Password>> getPasswords(String userId) async {
    Response res = await get(Uri.parse(
        "http://" + FlutterConfig.get('IP') + ":8090/secPwd/get-pwd/" + userId));
    if (res.statusCode == 200) {
      log(res.body);
      List<dynamic> body = jsonDecode(res.body);

      List<Password> products =
          body.map((dynamic item) => Password.fromJson(item)).toList();

      return products;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get passwords";
    }
  }
}
