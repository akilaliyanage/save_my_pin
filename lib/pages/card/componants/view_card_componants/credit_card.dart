import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
// ignore: library_prefixes
import 'package:save_my_pin/models/CreditCard.dart' as cardModel;
import 'package:save_my_pin/pages/card/componants/view_card_componants/card_details_form.dart';


// ignore: must_be_immutable
class CreditCard extends StatefulWidget {
  cardModel.CreditCard creditCard;
  int selectedcardState = 0;
  CreditCard({Key? key, required this.creditCard}) : super(key: key);
  @override
  _CreditCardState createState() => _CreditCardState(creditCard, selectedcardState);
}

class _CreditCardState extends State<CreditCard> {
  bool isCvvFocused = false;
  cardModel.CreditCard creditCard;
  int _selectedcardState;
  _CreditCardState(this.creditCard , this._selectedcardState);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CreditCardWidget(
            cardNumber: creditCard.cardNumber,
            expiryDate: creditCard.expiryDate,
            cardHolderName: creditCard.cardHolderName,
            cvvCode: creditCard.cvvCode.toString(),
            showBackView: isCvvFocused,
            obscureCardNumber: _selectedcardState == 0 ? true : false,
            obscureCardCvv: _selectedcardState == 0 ? true : false,
            isHolderNameVisible: true,
            cardBgColor: Colors.red,
            backgroundImage: 'assets/images/back7.jpg',
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand ) {  },
          ),
          SingleChildScrollView(
            child: CardDetailsForm(cardNumber:creditCard.cardNumber , expiryDate:creditCard.expiryDate , cardHolderName:creditCard.cardHolderName , cvvCode:creditCard.cvvCode.toString(), isCvvFocused:isCvvFocused, pin: creditCard.pinNo, id: creditCard.id, onCardVisibleChange:onCardVisibleChange),
          )
        ],
      ),
    );
  }

  void onCardVisibleChange(int status){
    setState(() {
      this._selectedcardState = status;
    });
  }
}
