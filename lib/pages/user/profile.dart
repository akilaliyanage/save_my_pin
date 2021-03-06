// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:save_my_pin/pages/user/navbar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../auth/Auth.dart';
import '../../models/User.dart';
import '../../utils/connection.dart';
import '../../utils/constants.dart' as Constants;

class Profile extends StatefulWidget {
  static const String routeName = '/profile';

  Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentIndex = 1;
  final storage = new FlutterSecureStorage();
  //User user = User('', '', '', '');
  String username = Auth.user.username;
  String old_access_key = "";
  String new_access_key = "";
  String old_password = "";
  String new_password = "";

  Future update() async {
    var id = await Auth.getUserId();

    var res = await http.put(
        Uri.parse(Connection.baseUrl + "/user/update/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'username': username,
        }));
    var result = jsonDecode(res.body);
    if (result['status'] == 200) {
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "{Profile Updated}",
        ),
      );
      Navigator.pushNamed(context, '/profile');
    } else
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went wrong!",
        ),
      );
  }

  Future updatePassword() async {
    var id = await Auth.getUserId();
    var res = await http.put(
        Uri.parse(Connection.baseUrl + "/user/update_password/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'old_password': old_password,
          'new_password': new_password
        }));
    var result = jsonDecode(res.body);
    if (result['status'] == 200) {
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "{Password Changed successfully}",
        ),
      );
      Navigator.pushNamed(context, '/profile');
    } else if (result['status'] == 401) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Password Mismatched!",
        ),
      );
    } else
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went wrong!",
        ),
      );
  }

  Future updateAccessCode() async {
    var id = await Auth.getUserId();
    var res = await http.put(
        Uri.parse(Connection.baseUrl + "/user/update_access_code/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'old_access_code': old_access_key,
          'new_access_code': new_access_key
        }));
    var result = jsonDecode(res.body);
    if (result['status'] == 200) {
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "{Access key Changed successfully}",
        ),
      );
      Navigator.pushNamed(context, '/profile');
    } else if (result['status'] == 401) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Access key Mismatched!",
        ),
      );
    } else
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went wrong!",
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
        ),
        drawer: const navBar(),
        body: FutureBuilder(
            future: Auth.view(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Constants.textColor,
                        ),
                      ),
                      Scaffold(
                        backgroundColor: Colors.transparent,
                        body: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 73),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        child: Image.asset(
                                          'assets/images/home_icon.png',
                                          width: 1,
                                        ),
                                        onTap: () => {
                                          Navigator.pushNamed(
                                              context, '/access')
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        child: const Text(''),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      fit: BoxFit.fitWidth,
                                      width: 200,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Edit Profile',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'Nisebuschgardens',
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: FloatingActionButton(
                                      onPressed: () => {
                                        Navigator.pushNamed(context, '/members')
                                      },
                                      backgroundColor: Constants.primaryColor,
                                      tooltip: 'Increment',
                                      child: Icon(Icons.group_add),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Container(
                                  height: height,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Positioned(
                                            left: 0,
                                            right: 0,
                                            top: 10,
                                            child: Container(
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Material(
                                                        elevation: 5.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: TextFormField(
                                                          controller:
                                                              TextEditingController(
                                                                  text: Auth
                                                                      .user
                                                                      .username),
                                                          onChanged: (value) {
                                                            username = value;
                                                          },
                                                          validator:
                                                              (String? value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return 'User Name is Required';
                                                            } else if (1 == 1) {
                                                              return null;
                                                            }
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixIcon: Icon(
                                                              Icons.person,
                                                              color: Constants
                                                                  .primaryColor,
                                                            ),
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 15),
                                                            hintText:
                                                                'User Name',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      child: FlatButton(
                                                        color: Constants
                                                            .primaryColor,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        minWidth: 200.0,
                                                        hoverColor: Constants
                                                            .primaryColor,
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            update();
                                                          }
                                                        },
                                                        child: const Text(
                                                            'Update',
                                                            style: TextStyle(
                                                                color: Constants
                                                                    .textColor)),
                                                        focusColor: Constants
                                                            .primaryColor,
                                                        shape: RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                color: Constants
                                                                    .primaryColor,
                                                                width: 1,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      'Password reset',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Constants
                                                            .primaryColor,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'Nisebuschgardens',
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Material(
                                                        elevation: 5.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: TextFormField(
                                                          obscureText: true,
                                                          controller:
                                                              TextEditingController(),
                                                          onChanged: (value) {
                                                            old_password =
                                                                value;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixIcon: Icon(
                                                              Icons.lock,
                                                              color: Constants
                                                                  .primaryColor,
                                                            ),
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 15),
                                                            hintText:
                                                                'Old password',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Material(
                                                        elevation: 5.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: TextFormField(
                                                          obscureText: true,
                                                          controller:
                                                              TextEditingController(),
                                                          onChanged: (value) {
                                                            new_password =
                                                                value;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixIcon: Icon(
                                                              Icons.lock,
                                                              color: Constants
                                                                  .primaryColor,
                                                            ),
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 15),
                                                            hintText:
                                                                'New password',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: FlatButton(
                                                        color: Constants
                                                            .primaryColor,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        minWidth: 200.0,
                                                        hoverColor: Constants
                                                            .primaryColor,
                                                        onPressed: () {
                                                          updatePassword();
                                                        },
                                                        child: const Text(
                                                            'Reset ',
                                                            style: const TextStyle(
                                                                color: Constants
                                                                    .textColor)),
                                                        focusColor: Constants
                                                            .primaryColor,
                                                        shape: RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                color: Constants
                                                                    .primaryColor,
                                                                width: 1,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      'Access code reset',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Constants
                                                            .primaryColor,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'Nisebuschgardens',
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Material(
                                                        elevation: 5.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: TextFormField(
                                                          obscureText: true,
                                                          controller:
                                                              TextEditingController(),
                                                          onChanged: (value) {
                                                            old_access_key =
                                                                value;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixIcon: Icon(
                                                              Icons.key,
                                                              color: Constants
                                                                  .primaryColor,
                                                            ),
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 15),
                                                            hintText:
                                                                'Old Access code',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Material(
                                                        elevation: 5.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: TextFormField(
                                                          obscureText: true,
                                                          controller:
                                                              TextEditingController(),
                                                          onChanged: (value) {
                                                            new_access_key =
                                                                value;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixIcon: Icon(
                                                              Icons.key,
                                                              color: Constants
                                                                  .primaryColor,
                                                            ),
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 15),
                                                            hintText:
                                                                'New Access code',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: FlatButton(
                                                        color: Constants
                                                            .primaryColor,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        minWidth: 200.0,
                                                        hoverColor: Constants
                                                            .primaryColor,
                                                        onPressed: () {
                                                          updateAccessCode();
                                                        },
                                                        child: const Text(
                                                            'Reset ',
                                                            style: const TextStyle(
                                                                color: Constants
                                                                    .textColor)),
                                                        focusColor: Constants
                                                            .primaryColor,
                                                        shape: RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                color: Constants
                                                                    .primaryColor,
                                                                width: 1,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return const Center(child: const CircularProgressIndicator());
            }));
  }
}
