import 'package:flutter/material.dart';
import '../basic_componants/card_header.dart';
import 'credit_card.dart';


class AddCardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size? size = MediaQuery?.of(context).size;
    // it enable scrolling on smalldevice
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardHeader(size: size, title: "Add Secure Card", image: Image.asset("assets/images/creditCard.gif")),
          CreditCard(),
        ],
      ),
    );
  }
}
