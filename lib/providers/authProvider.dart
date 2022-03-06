// import 'package:flutter/cupertino.dart';
// import '../auth/Auth.dart';
// import '../models/User.dart';
// import 'package:http/http.dart' as http;
// import '../utils/connection.dart';
// import 'dart:convert';

// class AuthProvider extends ChangeNotifier {
//   Future removeMember(id) async {
//     var res = await http.delete(
//         Uri.parse(Connection.baseUrl + "/user/remove_member/" + id),
//         headers: <String, String>{
//           'Content-Type': 'application/json;charSet=UTF-8'
//         });
//     notifyListeners();
//     var result = jsonDecode(res.body);

//     return result;
//   }

//   Future getUsers() async {
//     late List<User> members = [];
//     final String groupId = await Auth.getGroupId();
//     var res = await http.get(
//         Uri.parse(Connection.baseUrl + "/user/group/" + groupId),
//         headers: <String, String>{
//           'Content-Type': 'application/json;charSet=UTF-8'
//         }).then((response) {
//       var result = jsonDecode(response.body);
//       Iterable list = json.decode(response.body);
//       members = list.map((model) => User.fromJson(model)).toList();
//       print(members);
//       return members;
//     });
//   }
// }
