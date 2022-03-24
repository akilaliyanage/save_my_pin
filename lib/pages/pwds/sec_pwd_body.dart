import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/pwds/list_container.dart';
import 'package:save_my_pin/pages/pwds/pwd_header.dart';
import 'constants.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    // It will provie us total height  and width of our screen
    Size? size = MediaQuery?.of(context).size;
    // it enable scrolling on smalldevice 
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PwdHeader(size: size),
          PasswordList(),
          
        ],
      ),
    );
  }
}
