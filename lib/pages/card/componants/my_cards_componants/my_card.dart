import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  String cardNo = '4930798111448417';
  String expDate = '';
  String holderName = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNo,
            expiryDate: expDate,
            cardHolderName: holderName,
            cvvCode: cvv,
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
