import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';
import 'package:save_my_pin/models/SecureNotesModel.dart';

class HttpSecureNote {
  //final String getUrl = "http://" + FlutterConfig.get('IP') + ":8000/product";

  Future<List<SecureNote>> getAllNotes() async {
    Response res = await http.get(Uri.parse("http://localhost:8090/secure-notes/get-all"));

    log(res.toString());
    if (res.statusCode == 200) {
      log(res.body);
      List<dynamic> body = jsonDecode(res.body);

      List<SecureNote> products =
          body.map((dynamic item) => SecureNote.fromJson(item)).toList();

      print(products.toString());

      return products;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get SecureNotes";
    }
  }
}
