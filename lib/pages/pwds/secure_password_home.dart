import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/pwds/sec_pwd_body.dart';

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
  
}
