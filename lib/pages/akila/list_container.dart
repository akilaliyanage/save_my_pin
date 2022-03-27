import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:save_my_pin/api/http_service_secure_notes.dart';

import 'package:save_my_pin/models/SecureNotesModel.dart';
import 'constants.dart';

class SecureNotesList extends StatelessWidget {
  SecureNotesList({Key? key}) : super(key: key);

  final HttpSecureNote _httpSecureNote = HttpSecureNote();

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
                children: dataList!
                    .map(
                      (SecureNote e) => Column(
                        children: <Widget>[
                          secureNoteCard(
                            context,
                            e.noteName,
                            e.body,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ));
        });
  }
}

Widget secureNoteCard(BuildContext context, String noteName, String body) {
  Size? size = MediaQuery?.of(context).size;

  return Dismissible(
    onDismissed: (DismissDirection direction) {},
    key: UniqueKey(),
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
                  borderRadius: BorderRadius.circular(10),
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
                                noteName,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                body.replaceRange(0, 6, "******"),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.black54),
                              ),
                            )
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
  );
}
