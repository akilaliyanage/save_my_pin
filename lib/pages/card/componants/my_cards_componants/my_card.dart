import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:save_my_pin/api/http_service_cards.dart';

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
  HttpServiceCard service= new HttpServiceCard();
  _MyCardState(this.cardNumber, this.expiryDate, this.cardHolderName, this.cvvCode);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(0 , 0, 10, 0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
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
                Align(
                  alignment: Alignment.bottomRight,
                  // add your floating action button
                  child: FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {},
                    child: Icon(Icons.arrow_forward_rounded),
                  ),
                ),
                Align(
                  heightFactor: 3.5,
                  alignment: Alignment.bottomRight,
                  // add your floating action button
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      print("Called I");
                      deleteConfirmation(context , cardNumber);
                    },
                    child: Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  deleteConfirmation(BuildContext dialogContext , String cardNo){
    print("Called" + cardNumber);
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: true,
      isOverlayTapDismiss: true,
      descStyle: const TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.center,
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: const TextStyle(
        color: Colors.red,
      ),
      alertAlignment: Alignment.center,
    );

    Alert(
      context: context,
      style: alertStyle,
      title: "Delete Confirmation",
      desc: "Are yoy sure, you want to delete this card?",
      buttons: [
        DialogButton(
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            print("C is : " + cardNumber);
            service.deleteCard(context , cardNo);
            },
          color: Colors.red,
          radius: BorderRadius.circular(0.0),
        ),
        DialogButton(
          child: const Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: ()  => Navigator.pop(context),
          color: Colors.green,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
}
