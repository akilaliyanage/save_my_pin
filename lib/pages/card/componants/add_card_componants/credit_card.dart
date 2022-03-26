import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'card_form.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNo = '';
  String expDate = '';
  String holderName = '';
  String cvv = '';
  bool isCvvFocused = false;

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
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: Colors.red,
            backgroundImage: 'assets/images/back7.jpg',
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand ) {  },
          ),
          SingleChildScrollView(
            child: CardForm(cardNumber:cardNo , expiryDate:expDate , cardHolderName:holderName , cvvCode:cvv, isCvvFocused:isCvvFocused),
          )
        ],
      ),
    );
  }
}
