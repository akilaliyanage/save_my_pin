import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:save_my_pin/pages/akila/constants.dart';
import 'package:save_my_pin/api/http_service_secure_notes.dart';

class NewSecureNoteForm extends StatefulWidget {
  const NewSecureNoteForm({Key? key}) : super(key: key);

  @override
  State<NewSecureNoteForm> createState() => _NewSecureNoteFormState();
}

class _NewSecureNoteFormState extends State<NewSecureNoteForm> {
  String noteName = '';
  String noteBody = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    this.noteName = value;
                    print(noteName);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the secure note name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: kIconColor,
                    //filled: true,
                    //enabledBorder: InputBorder.none,
                    //focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(1),
                    ),
                    // surffix isn't working properly  with SVG
                    // thats why we use row
                    // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      this.noteBody = value;
                      print(noteBody);
                    });
                  },
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: "Enter or paste the secure note here...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: kIconColor,
                    //filled: true,
                    //enabledBorder: InputBorder.none,
                    //focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(1),
                    ),
                    // surffix isn't working properly  with SVG
                    // thats why we use row
                    // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(minHeight: 50.0),
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () async {
                HttpSecureNote secure_note = new HttpSecureNote();

                bool response = await secure_note.saveNote(noteName, noteBody);

                if (response) {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "SAVE SUCCESSSFUL!!",
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
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        'Save Note',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
