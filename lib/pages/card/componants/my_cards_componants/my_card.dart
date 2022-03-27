import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class MyCard extends StatefulWidget {
  String cardNumber;
  String expiryDate ;
  String cardHolderName;
  String cvvCode;
  MyCard({Key? key, required this.cardNumber , required this.expiryDate , required this.cardHolderName , required this.cvvCode}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _MyCardState createState() => _MyCardState(cardNumber, expiryDate, cardHolderName, cvvCode);
}

class _MyCardState extends State<MyCard> {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;

  _MyCardState(this.cardNumber, this.expiryDate, this.cardHolderName, this.cvvCode);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: false,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: Colors.blue,
            onCreditCardWidgetChange: (CreditCardBrand ) {  },
            height: 165,
            isChipVisible: false,
          ),
        ],
      ),
    );
  }

}
