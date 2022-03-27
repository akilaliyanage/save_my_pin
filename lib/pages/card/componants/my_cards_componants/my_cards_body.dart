import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/card/componants/my_cards_componants/my_card.dart';
import '../basic_componants/card_header.dart';


class MyCardsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size? size = MediaQuery?.of(context).size;
    // it enable scrolling on smalldevice
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardHeader(size: size , title: "My Cards", image: Image.asset("assets/images/creditCard.gif"),),
          MyCard()
        ],
      ),
    );
  }
}
