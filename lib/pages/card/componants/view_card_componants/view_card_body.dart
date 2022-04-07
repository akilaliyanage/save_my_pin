import 'package:flutter/material.dart';
import 'package:save_my_pin/models/CreditCard.dart';
import '../view_card_componants/credit_card.dart' as cardView;
import '../basic_componants/card_header.dart';

class ViewCardBody extends StatefulWidget {
  CreditCard creditCard;
  ViewCardBody({Key? key, required this.creditCard}) : super(key: key);
  @override
  State<ViewCardBody> createState() => _ViewCardBodyState(creditCard);
}

class _ViewCardBodyState extends State<ViewCardBody> {
  CreditCard creditCard;
  _ViewCardBodyState(this.creditCard);
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
          cardView.CreditCard(creditCard: this.creditCard,),
        ],
      ),
    );
  }
}
