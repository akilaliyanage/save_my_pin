import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:save_my_pin/api/http_service_password.dart';

import '../../models/SecurePassword.dart';
import 'constants.dart';

class PasswordList extends StatelessWidget {
  PasswordList({Key? key}) : super(key: key);

  final HttpServicePassword _httpServicePassword =  HttpServicePassword();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future:
                _httpServicePassword.getPasswords('6224b48fdcf09c1754390365'),
            builder:
                (BuildContext context, AsyncSnapshot<List<Password>> snapshot) {
                  // log(snapshot.toString());
                  // debugPrint('movieTitle:'+ snapshot.toString());
              if (snapshot.hasData) {
                // log(snapshot.data.toString());
                List<Password>? dataList = snapshot.data as List<Password>;
                return Padding(
                    padding: const EdgeInsets.only(
                      bottom: kDefaultPadding * 0.5,
                    ),
                    child: Column(
                      children: dataList.map(
                            (Password e) => Column(
                              children: <Widget>[
                                passwordCard(context, e.website, e.username,
                                    e.password, e.date),
                              ],
                            ),
                          )
                          .toList(),
                    )
                    );
              }else {
                return const Center(child: CircularProgressIndicator());
              }
              
            }));
  }
}

Widget passwordCard(BuildContext context, String website, String username,
    String password, DateTime date) {
  Size? size = MediaQuery?.of(context).size;

  return SizedBox(
      width: size.width * 0.95,
      child: Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2,
          ),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                left: kDefaultPadding,
                bottom: kDefaultPadding * 0.5,
              ),
              elevation: 2,
              child: Padding(
                  padding: const EdgeInsets.only(
                    right: kDefaultPadding,
                    top: kDefaultPadding / 2,
                    bottom: kDefaultPadding / 2,
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                left: kDefaultPadding * 0.8,
                                right: kDefaultPadding * 0.8),
                            child: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              website,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              username,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black54),
                            ),
                          ),
                          Text(
                            password,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black54),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.only(right: kDefaultPadding * 0.3),
                            child: Text(
                              'Edit',
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 236, 153, 152),
                          )
                        ],
                      )
                    ],
                  )))));
}
