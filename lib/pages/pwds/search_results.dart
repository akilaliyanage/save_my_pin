import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/add_new/new_secure_note_form.dart';
import 'package:save_my_pin/pages/akila/list_container.dart';
import 'package:save_my_pin/pages/akila/pwd_header.dart';
import 'constants.dart';
import 'search_pwdHead.dart';

class search_results extends StatefulWidget {
  search_results({Key? key}) : super(key: key);

  @override
  State<search_results> createState() => _search_pwdState();
}

class _search_pwdState extends State<search_results> {
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
          SearchPwdHeader(size: size),
          // NewPwdForm()
        ],
      ),
    );
  }
}