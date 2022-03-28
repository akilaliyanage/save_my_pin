import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/Pwd_nav_bar_custom.dart';
import 'package:save_my_pin/pages/akila/sec_pwd_body.dart';

import 'add_new/add_new_secure_note.dart';
import 'constants.dart';

class secure_note_home extends StatefulWidget {
  secure_note_home({Key? key}) : super(key: key);

  @override
  State<secure_note_home> createState() => _secure_note_homeState();
}

class _secure_note_homeState extends State<secure_note_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const PwdnavBarCustom(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => add_new_secure_note()),
          );
        },
      ),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      // leading: IconButton(
      //   icon: Image.asset("assets/images/menu.png"),
      //   onPressed: () {
      //     // Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(builder: (context) => PwdnavBarCustom()),
      //     // );
      //   },
      // ),
      backgroundColor: kPrimaryColor,
      // leading: IconButton(
      //   icon: Icons.menu
      //   onPressed: () {},
      // ),
    );
  }

  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
