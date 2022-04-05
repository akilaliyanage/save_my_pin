import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/card/componants/view_card_componants/view_card_body.dart';
import '../pwds/constants.dart';
import 'componants/basic_componants/card_nav_bar.dart';


class CardDetails extends StatefulWidget {
  static const String routeName = '/card_details';
  CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetails();
}

class _CardDetails extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const CardnavBar(),
      body: ViewCardBody(),
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
