import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/pwds/sec_pwd_body.dart';

import 'add_new/add_new_pwd.dart';
import 'constants.dart';

class secure_password_home extends StatefulWidget {
  secure_password_home({Key? key}) : super(key: key);

  @override
  State<secure_password_home> createState() => _secure_password_homeState();
}

class _secure_password_homeState extends State<secure_password_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => add_new_pwd()),
          );
        },
      ),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
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
