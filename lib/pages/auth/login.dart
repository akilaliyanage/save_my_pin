import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../models/User.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final storage = new FlutterSecureStorage();
  User user = User('', '', '', '');

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
                  "Sign In",
                  style: TextStyle(
                      color: Colors.blue,
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
                                      controller: TextEditingController(
                                          text: user.email),
                                      onChanged: (value) {
                                        user.email = value;
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
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
                                          color: Colors.blue,
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
                                          color: Colors.blue,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Password',
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
                    color: Colors.blue,
                    padding: const EdgeInsets.all(20.0),
                    minWidth: 200.0,
                    hoverColor: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // save();
                      }
                    },
                    child:
                        Text('Sign In', style: TextStyle(color: Colors.white)),
                    focusColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("create account"),
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
