import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/add_new/new_secure_note_form.dart';
import 'package:save_my_pin/pages/akila/list_container.dart';
import 'package:save_my_pin/pages/akila/pwd_header.dart';
import '../constants.dart';
import 'new_secure_note_head.dart';

class add_new_secure_note extends StatefulWidget {
  add_new_secure_note({Key? key}) : super(key: key);

  @override
  State<add_new_secure_note> createState() => _add_new_secure_noteState();
}

class _add_new_secure_noteState extends State<add_new_secure_note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: AddNew_Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

}

class AddNew_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AddNewSecureNoteHdr(size: size),
          NewSecureNoteForm()
          
        ],
      ),
    );
  }
}