import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/pwds/add_new/add_new_pwd_from.dart';
import 'package:save_my_pin/pages/pwds/list_container.dart';
import 'package:save_my_pin/pages/pwds/pwd_header.dart';
import '../constants.dart';
import 'new_pwd_head.dart';

class add_new_pwd extends StatefulWidget {
  add_new_pwd({Key? key}) : super(key: key);

  @override
  State<add_new_pwd> createState() => _add_new_pwdState();
}

class _add_new_pwdState extends State<add_new_pwd> {
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
          AddNewPwdHeader(size: size),
          NewPwdForm()
        ],
      ),
    );
  }
}