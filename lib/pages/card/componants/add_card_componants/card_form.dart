import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:save_my_pin/models/CreditCard.dart';
import 'package:save_my_pin/api/http_service_cards.dart';

import '../../../../auth/Auth.dart';
import '../../../pwds/constants.dart';
import '../../providers/device_provider.dart';

class CardForm extends StatefulWidget {
  String? cardNumber;
  String? expiryDate ;
  String? cardHolderName;
  String? cvvCode;
  bool? isCvvFocused;
  // ignore: prefer_typing_uninitialized_variables
  final onFormDataChange;
  HttpServiceCard service = HttpServiceCard();
  CardForm({Key? key, this.cardNumber , this.expiryDate , this.cardHolderName , this.cvvCode , this.isCvvFocused, this.onFormDataChange}) : super(key: key);
  @override
  _CardFormState createState() => _CardFormState(cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused);
}

class _CardFormState extends State<CardForm> {
  String? cardNumber;
  String? expiryDate ;
  String? cardHolderName;
  String? cvvCode;
  bool? isCvvFocused;
  int? pin;
  int? confirmPin;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _CardFormState(this.cardNumber , this.expiryDate , this.cardHolderName , this.cvvCode , this.isCvvFocused);

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
                        keyboardType: TextInputType.number,
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
                        onChanged: (String? value){
                          if(value != null && value != ''){
                            setState(() {
                              pin = int.parse(value);
                            });
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
                        onChanged: (String? value){
                          if(value != null && value != ''){
                            setState(() {
                              confirmPin = int.parse(value);
                            });
                          }
                        },
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
                  onPressed: () async {
                  if(!formKey.currentState!.validate()){
                    Fluttertoast.showToast(
                        msg: "Invalid Card Details!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  // ignore: unrelated_type_equality_checks
                  else if(pin == null || pin == ''){
                    Fluttertoast.showToast(
                        msg: "Pin cannot be empty",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  else if(pin != confirmPin){
                    Fluttertoast.showToast(
                        msg: "Pin and Confirm Pin should match",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  else{
                    CreditCard card = CreditCard(id: '',cardNumber: cardNumber!, expiryDate: expiryDate!, cardHolderName: cardHolderName!, cvvCode: int.parse(cvvCode!), pinNo: pin!, cardType: "VISA");
                    HttpServiceCard service = HttpServiceCard();
                    var adminId = await Auth.getUserId();
                    await service.addCard(card , adminId, context);
                  }

                  },
                  child: const Text(
                    'Add Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
    });
    widget.onFormDataChange(creditCardModel);
  }
}
