import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:save_my_pin/api/http_service_password.dart';

import '../../models/SecurePassword.dart';
import 'constants.dart';

class PasswordList extends StatelessWidget {
  PasswordList({Key? key}) : super(key: key);

  final HttpServicePassword _httpServicePassword = HttpServicePassword();

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
                log(snapshot.data.toString());
                List<Password> dataList = snapshot.data as List<Password>;
                return Padding(
                    padding: const EdgeInsets.only(
                      bottom: kDefaultPadding * 0.5,
                    ),
                    child: Column(
                      children: dataList
                          .map(
                            (Password e) => Column(
                              children: <Widget>[
                                passwordCard(context, e.website, e.username,
                                    e.password, e.date, e.id),
                              ],
                            ),
                          )
                          .toList(),
                    ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}

Widget passwordCard(BuildContext context, String website, String username,
    String password, DateTime date, String id) {
  Size? size = MediaQuery?.of(context).size;
  print(website);

  String updatePass = "";

  return InkWell(
    onTap: () {
      Alert(
        context: context,
        type: AlertType.info,
        title: "PASSWORD COPIED TO THE CLIPBOARD!!",
        //desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
          )
        ],
      ).show();
    },
    child: SizedBox(
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
                                'website',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'username',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black54),
                              ),
                            ),
                            Text(
                              'password',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black54),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    right: kDefaultPadding * 0.3),
                                child: InkWell(
                                  onTap: () {
                                    print('object');

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: new Text('EDIT PASSWORD'),
                                          content: TextField(
                                            onChanged: (value) {
                                              print(value);
                                              updatePass = value;
                                            },
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter the new password text"),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: new Text("OK"),
                                              onPressed: () {
                                                print(updatePass);
                                                final HttpServicePassword
                                                    _httpServicePassword =
                                                    HttpServicePassword();
                                                Alert(
                                                  context: context,
                                                  type: AlertType.success,
                                                  title: "DELETE SUCCESSSFUL!!",
                                                  //desc: "Flutter is more awesome with RFlutter Alert.",
                                                  buttons: [
                                                    DialogButton(
                                                      child: Text(
                                                        "OK",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      color: Color.fromRGBO(
                                                          0, 179, 134, 1.0),
                                                    )
                                                  ],
                                                ).show();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.blue),
                                  ),
                                ))
                          ],
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            IconButton(
                                onPressed: () async {
                                  print('object');
                                  final HttpServicePassword
                                      _httpServicePassword =
                                      HttpServicePassword();
                                  bool isdel = await _httpServicePassword
                                      .delNote(id) as bool;

                                  if (isdel) {
                                    Alert(
                                      context: context,
                                      type: AlertType.success,
                                      title: "DELETE SUCCESSSFUL!!",
                                      //desc: "Flutter is more awesome with RFlutter Alert.",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          color:
                                              Color.fromRGBO(0, 179, 134, 1.0),
                                        )
                                      ],
                                    ).show();
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 236, 153, 152),
                                ))
                          ],
                        )
                      ],
                    ))))),
  );
}
