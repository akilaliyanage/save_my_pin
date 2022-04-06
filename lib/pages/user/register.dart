import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../models/User.dart';
import '../../utils/connection.dart';
import '../../utils/constants.dart' as Constants;

class Register extends StatefulWidget {
  static const String routeName = '/register';

  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final storage = new FlutterSecureStorage();
  User user = User('', '', '', '', '');

  Future save() async {
    var res = await http.post(Uri.parse(Connection.baseUrl + "/user/register"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'email': user.email,
          'username': user.username,
          'access_code': user.accessCode,
          'password': user.password
        }));
    var result = jsonDecode(res.body);
    print(result['status']);
    if (result['status'] == 201) {
      await storage.write(key: "email", value: user.email);
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Successfilly Registered!",
        ),
      );
      Navigator.pushNamed(context, '/login');
    } else if (result['status'] == 401) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "User Already exist!",
        ),
      );
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went rong!",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/wave2.png'),
              //         fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 55,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 120.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25),
                                    child: TextFormField(
                                      controller:
                                          TextEditingController(text: null),
                                      onChanged: (value) {
                                        user.email = value;
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty && value == null) {
                                          return 'Email is Required';
                                        } else if (RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                          return null;
                                        } else {
                                          return 'Enter a valid email';
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Constants.primaryColor,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Email',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25),
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text: user.username),
                                      onChanged: (value) {
                                        user.username = value;
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Username is Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Constants.primaryColor,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Username',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: TextEditingController(
                                          text: user.password),
                                      onChanged: (value) {
                                        user.password = value;
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Password is Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Constants.primaryColor,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Password',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: TextEditingController(
                                          text: user.accessCode),
                                      onChanged: (value) {
                                        user.accessCode = value;
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Access code is Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.key,
                                          color: Constants.primaryColor,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Access code',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    color: Constants.primaryColor,
                    padding: const EdgeInsets.all(20.0),
                    minWidth: 200.0,
                    hoverColor: Constants.primaryColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        save();
                      }
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                          color: Constants.textColor,
                          fontSize: 20,
                        )),
                    focusColor: Constants.primaryColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Constants.primaryColor,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    textColor: Constants.primaryColor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text("Already registered ?"),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );

    throw UnimplementedError();
  }
}
