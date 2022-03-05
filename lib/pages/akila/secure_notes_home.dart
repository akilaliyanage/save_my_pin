import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:save_my_pin/pages/akila/nab_bar_custom.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:animate_icons/animate_icons.dart';

class secure_notes_home extends StatefulWidget {
  secure_notes_home({Key? key}) : super(key: key);

  @override
  State<secure_notes_home> createState() => _secure_notes_homeState();
}

// ignore: camel_case_types
class _secure_notes_homeState extends State<secure_notes_home> {
  List pins = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SECURE NOTES")),
      drawer: const navBarCustom(),
      body: ListView(
        // This next line does the trick.
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 160.0,
            color: Colors.red,
          ),
          Container(
            height: 160.0,
            color: Colors.blue,
          ),
          Container(
            height: 160.0,
            color: Colors.green,
          ),
          Container(
            height: 160.0,
            color: Colors.yellow,
          ),
          Container(
            height: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
