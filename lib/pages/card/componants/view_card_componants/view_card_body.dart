import 'package:flutter/material.dart';
import '../view_card_componants/credit_card.dart';
import '../basic_componants/card_header.dart';


class ViewCardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size? size = MediaQuery?.of(context).size;
    // it enable scrolling on smalldevice
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardHeader(size: size, title: "Credit Card Details", image: Image.asset("assets/images/creditCard.gif")),
          CreditCard(),
        ],
      ),
    );
  }
}
