import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:animate_icons/animate_icons.dart';

class secure_notes_home extends StatefulWidget {
  secure_notes_home({Key? key}) : super(key: key);

  @override
  State<secure_notes_home> createState() => _secure_notes_homeState();
}

// ignore: camel_case_types
class _secure_notes_homeState extends State<secure_notes_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("GeeksForGeeks")),
      body: const Center(
        child: Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}