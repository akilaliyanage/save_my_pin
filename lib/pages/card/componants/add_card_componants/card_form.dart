import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../pwds/constants.dart';
import '../../providers/device_provider.dart';

class CardForm extends StatefulWidget {
  String? cardNumber;
  String? expiryDate ;
  String? cardHolderName;
  String? cvvCode;
  bool? isCvvFocused;

  CardForm({Key? key, this.cardNumber , this.expiryDate , this.cardHolderName , this.cvvCode , this.isCvvFocused}) : super(key: key);
  @override
  _CardFormState createState() => _CardFormState(cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused);
}

class _CardFormState extends State<CardForm> {
  String? cardNumber;
  String? expiryDate ;
  String? cardHolderName;
  String? cvvCode;
  bool? isCvvFocused;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _CardFormState(this.cardNumber , this.expiryDate , this.cardHolderName , this.cvvCode , this.isCvvFocused);


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
        CreditCardForm(
            obscureCvv: true,
            obscureNumber: true,
            cardNumber: cardNumber ?? "",
            expiryDate: expiryDate ?? "",
            cardHolderName: cardHolderName ?? "",
            cvvCode: cvvCode ?? "",
            onCreditCardModelChange:  onCreditCardModelChange,
            themeColor: Colors.blue,
            textColor: Colors.black,
            formKey: formKey,
            cardNumberDecoration: InputDecoration(
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
              hintStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: border,
              enabledBorder: border
            ),
            expiryDateDecoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'Card Holder',
            ),
        ),
        Container(
          margin: EdgeInsets.all(DeviceProvider.deviceWidth(context) * 0.02),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2.0
                              )
                          ),
                          labelText: "Pin",
                        ),
                        validator: (String? value){
                          if(value == Null || value!.trim().isEmpty){
                            return "Pin number cannot be empty";
                          }
                        },
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2.0
                              )
                          ),
                          labelText: "Confirm Pin",
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(147, 10, 147, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  primary: kPrimaryColor2
                ),
                  onPressed: (){

                  },
                  child: Container(
                    child: const Text(
                      'Add Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
              )
            ],
          ),
        )
      ],
    );
  }
  void onCreditCardModelChange(CreditCardModel? creditCardModel){
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
