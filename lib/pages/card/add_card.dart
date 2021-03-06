import 'package:flutter/material.dart';
import '../pwds/constants.dart';
import 'componants/add_card_componants/add_card_body.dart';
import 'componants/basic_componants/card_nav_bar.dart';


class add_card extends StatefulWidget {
  static const String routeName = '/add_card';
  add_card({Key? key}) : super(key: key);

  @override
  State<add_card> createState() => _add_card();
}

class _add_card extends State<add_card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const CardnavBar(),
      body: AddCardBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
    );
  }

  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
