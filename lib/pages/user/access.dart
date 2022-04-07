import 'package:flutter/material.dart';
import 'package:save_my_pin/models/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:save_my_pin/pages/user/login.dart';
import 'package:save_my_pin/pages/user/navbar.dart';
import 'package:save_my_pin/pages/user/profile.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../auth/Auth.dart';
import '../../models/User.dart';
import '../../utils/connection.dart';

import '../../models/User.dart';

class Access extends StatefulWidget {
  static const String routeName = '/access';
  const Access({Key? key}) : super(key: key);

  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
  User user = User('', '', '', '', '');

  Future validate(route) async {
    var groupId = await Auth.getGroupId();
    var res = await http.post(Uri.parse(Connection.baseUrl + "/user/access"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'access_code': user.accessCode,
          'group': groupId
        }));
    var result = await jsonDecode(res.body);
    print(groupId);
    if (result['status'] == 200) {
      var userId = result['user']['_id'];
      var userType = result['user']['userType'];
      await Auth.saveTempUser(userId, userType);

      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Access granted",
        ),
      );
      Navigator.pushNamed(context, route);
    } else if (result['status'] == 401) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Access Denied",
        ),
      );
    } else if (result['status'] == 404) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "User does not exist!",
        ),
      );
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went wrong!",
        ),
      );
    }
  }

  Future validateAdmin() async {
    var groupId = await Auth.getGroupId();
    var res = await http.post(Uri.parse(Connection.baseUrl + "/user/access"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'access_code': user.accessCode,
          'group': groupId
        }));
    var result = await jsonDecode(res.body);
    print(groupId);
    if (result['status'] == 200 &&
        result['user']['userType'] == "accountManager") {
      var userId = result['user']['_id'];
      var userType = result['user']['userType'];
      await Auth.saveTempUser(userId, userType);

      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Access granted",
        ),
      );
      Navigator.pushNamed(context, Profile.routeName);
    } else if (result['status'] == 401) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Access Denied",
        ),
      );
    } else if (result['status'] == 404) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "User does not exist!",
        ),
      );
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went wrong!",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Save My Pin'),
        actions: [
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Access Key'),
                      content: TextField(
                        onChanged: (value) {
                          setState(() {
                            user.accessCode = value;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Insert Your Access Key"),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: const Text('OK'),
                          onPressed: () {
                            setState(() {
                              validateAdmin();
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ],
                    );
                  }),
              icon: Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: ListView.builder(
                itemCount: appServices.length,
                itemBuilder: (context, index) {
                  Service item = appServices.elementAt(index);
                  return GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Access Key'),
                            content: TextField(
                              onChanged: (value) {
                                setState(() {
                                  user.accessCode = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: "Insert Your Access Key"),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                child: const Text('OK'),
                                onPressed: () {
                                  setState(() {
                                    validate(item.routePath);
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ],
                          );
                        }),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Card(
                        elevation: 10,
                        margin: const EdgeInsets.all(10),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(item.image),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}