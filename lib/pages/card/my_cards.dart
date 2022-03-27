import 'package:flutter/material.dart';
import '../pwds/constants.dart';
import 'componants/basic_componants/card_nav_bar.dart';
import 'componants/my_cards_componants/my_cards_body.dart';


class my_cards extends StatefulWidget {
  static const String routeName = '/my_cards';
  my_cards({Key? key}) : super(key: key);

  @override
  State<my_cards> createState() => _my_cards();
}

class _my_cards extends State<my_cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const CardnavBar(),
      body: MyCardsBody(),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
    );
  }
}
