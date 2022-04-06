import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:save_my_pin/api/http_service_cards.dart';
import '../../../pwds/constants.dart';
import '../../providers/device_provider.dart';

class CardDetailsForm extends StatefulWidget {
  String? cardNumber;
  String? expiryDate ;
  String? cardHolderName;
  String? cvvCode;
  bool? isCvvFocused;
  int? pin;

  int selectedPinState = 0;
  int selectedcardState = 0;

  final onCardVisibleChange;
  // ignore: prefer_typing_uninitialized_variables
  HttpServiceCard service = HttpServiceCard();
  CardDetailsForm({Key? key, this.cardNumber , this.expiryDate , this.cardHolderName , this.cvvCode , this.isCvvFocused, this.pin, this.onCardVisibleChange}) : super(key: key);
  @override
  _CardDetailsFormState createState() => _CardDetailsFormState(cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused, pin, selectedPinState, selectedcardState);
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  String? cardNumber;
  String? expiryDate ;
  String? cardHolderName;
  String? cvvCode;
  bool? isCvvFocused;
  int? pin;
  int? confirmPin;
  OutlineInputBorder? border;
  bool showDetailsState = false;
  bool showPinState = false;
  int selectedPinState = 1;
  int selectedcardState = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _CardDetailsFormState(this.cardNumber , this.expiryDate , this.cardHolderName , this.cvvCode , this.isCvvFocused, this.pin, this.selectedPinState , this.selectedcardState);

  get service => null;


  @override
  void initState() {
    border = const OutlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
          width: 2.0,
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(DeviceProvider.deviceWidth(context) * 0.02),
          child: Column(
            children: [
              Row(
                children:  [
                  Expanded(
                      child: Text(
                        selectedPinState == 0 ? "****" : pin.toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 54
                        ),
                      )
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                      child: Text(
                        'Pin No',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: const [
                  Expanded(
                      child: Text(
                        'Show/Hide Pin No',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          fontSize: 16
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  FlutterToggleTab(
                    width: DeviceProvider.deviceWidth(context) * 0.125,
                    height: 50,
                    borderRadius: 15,
                    selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    unSelectedTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    labels: ["Hide","Show"],
                    icons: [Icons.visibility_off,Icons.visibility],
                    selectedIndex: this.selectedPinState,
                    selectedLabelIndex: (index) {
                      setState(() {
                        selectedPinState = index;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: const [
                  Expanded(
                      child: Text(
                        'Show/Hide Card Details',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            fontSize: 16
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  FlutterToggleTab(
                    width: DeviceProvider.deviceWidth(context) * 0.125,
                    height: 50,
                    borderRadius: 15,
                    selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    unSelectedTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    labels: ["Hide","Show"],
                    icons: [Icons.visibility_off,Icons.visibility],
                    selectedIndex: this.selectedcardState,
                    selectedLabelIndex: (index) {
                      setState(() {
                        selectedcardState = index;
                      });
                      onCardVisibleChange(selectedcardState);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: DeviceProvider.deviceWidth(context) * 0.8,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        primary: kPrimaryColor2
                    ),
                    onPressed: () {

                    },
                    child: Container(
                      child: const Text(
                        'Reset Pin No',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void onCardVisibleChange(int selectedcardState) {
    widget.onCardVisibleChange(selectedcardState);
  }



}
