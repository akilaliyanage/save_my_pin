import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:save_my_pin/utils/connection.dart';
import 'package:http/http.dart' as http;
import 'package:save_my_pin/models/User.dart';

class Auth {
  static final storage = new FlutterSecureStorage();
  static User user = User('', '', '', '', '');

//Remember user for next login
  static Future<void> rememberUser(
      String id, String name, String groupId) async {
    await storage.write(key: "user_id", value: id);
    await storage.write(key: "username", value: name);
    await storage.write(key: "group_id", value: groupId);
  }

  //Logout
  static Future<void> logoutUser() async {
    await storage.write(key: "user_id", value: null);
    await storage.write(key: "username", value: null);
    await storage.write(key: "group_id", value: null);
  }

  //Temporary user session
  static Future<void> saveTempUser(String id, String type) async {
    await storage.write(key: "temp_user_id", value: id);
    await storage.write(key: "temp_user_type", value: type);
  }

//Get the current user id
  static Future<String> getUserId() async {
    var user_id = await storage.read(key: "user_id");
    return user_id.toString();
  }

  //Get the current user name
  static Future<String> getUserName() async {
    var user_id = await storage.read(key: "username");
    return user_id.toString();
  }

  //Get the group id
  static Future<String> getGroupId() async {
    var groupId = await storage.read(key: "group_id");
    return groupId.toString();
  }

  //Get the temp user id
  static Future<String> getTempUserId() async {
    var user_id = await storage.read(key: "temp_user_id");
    return user_id.toString();
  }

  //Get the current user type
  static Future<String> getTempUserType() async {
    var user_id = await storage.read(key: "temp_user_type");
    return user_id.toString();
  }

//Check if user is previously logged in
  static Future<bool> isLoggedIn() async {
    String? user_id = await storage.read(key: "user_id");
    print(user_id);
    if (user_id == null) {
      return false;
    } else {
      return true;
    }
  }

//Get the user profile details
  static Future<User> view() async {
    var id = await getUserId();
    var res = await http.get(Uri.parse(Connection.baseUrl + "/user/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        });
    var result = await jsonDecode(res.body);
    user.id = await result['user']['_id'];
    user.username = await result['user']['username'];
    user.email = await result['user']['email'];
    user.accessCode = await result['user']['accessCode'];
    user.password = await result['user']['password'];
    print(Auth.user);
    return user;
  }
}
