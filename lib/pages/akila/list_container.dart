import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:save_my_pin/api/http_service_secure_notes.dart';

import 'package:save_my_pin/models/SecureNotesModel.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'constants.dart';

class SecureNotesList extends StatefulWidget {
  SecureNotesList({Key? key}) : super(key: key);

  @override
  State<SecureNotesList> createState() => _SecureNotesListState();
}

class _SecureNotesListState extends State<SecureNotesList> {
  final HttpSecureNote _httpSecureNote = HttpSecureNote();

  String editSecureNote = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SecureNote>>(
        future: _httpSecureNote.getAllNotes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SecureNote>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<SecureNote> dataList = snapshot.data as List<SecureNote>;

          //print(dataList[1].body);

          return Padding(
              padding: const EdgeInsets.only(
                  // left: kDefaultPadding,
                  // right: kDefaultPadding,
                  //bottom: kDefaultPadding * 0.5,
                  ),
              child: Column(
                children: dataList
                    .map(
                      (SecureNote e) => Column(
                        children: <Widget>[
                          secureNoteCard(context, e.noteName, e.body, e.id),
                        ],
                      ),
                    )
                    .toList(),
              ));
        });
  }
}

Widget secureNoteCard(
    BuildContext context, String noteName, String body, String id) {
  Size? size = MediaQuery?.of(context).size;
  String updateNote = "";
  return InkWell(
    onTap: () {
      Clipboard.setData(ClipboardData(text: body));
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Successfilly Copied!",
        ),
      );
    },
    onDoubleTap: () {
      print(id);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('EDIT SECURE NOTE'),
            content: TextField(
              onChanged: (value) {
                print(value);
                updateNote = value;
              },
              decoration:
                  InputDecoration(hintText: "Enter the new secure text"),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  print(updateNote);

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
    child: Dismissible(
      onDismissed: (DismissDirection direction) {
        //delete the note
        Alert(
          context: context,
          type: AlertType.warning,
          title: "DELETE NOTE?",
          desc: "This action is irreveesable. Want to proceed?",
          buttons: [
            DialogButton(
              child: Text(
                "DELETE",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () async {
                HttpSecureNote secureNote = new HttpSecureNote();

                bool isDel = await secureNote.delNote(id);

                if (isDel) {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "DELETE SUCCESSSFUL!!",
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
                }
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "CANCEL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 255, 0, 0),
                Color.fromARGB(255, 255, 8, 0)
              ]),
            )
          ],
        ).show();
      },
      key: Key(id),
      secondaryBackground: Container(
        child: Center(
          child: Text(
            'Delete',
            style: TextStyle(color: Colors.white),
          ),
        ),
        color: Colors.red,
      ),
      background: Container(),
      child: SizedBox(
          width: size.width * 1,
          child: Padding(
              padding: const EdgeInsets.only(
                //left: kDefaultPadding / 2,
                right: kDefaultPadding / 2,
              ),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.only(
                    left: kDefaultPadding / 2,
                    bottom: kDefaultPadding * 0.5,
                  ),
                  elevation: 3,
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
                                  noteName.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Tap to copy the text",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black54),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: kDefaultPadding * 0.3),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // Icon(
                              //   Icons.edit,
                              //   color: Colors.blue,
                              // ),
                              const Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 236, 153, 152),
                              )
                            ],
                          )
                        ],
                      ))))),
    ),
  );
}
