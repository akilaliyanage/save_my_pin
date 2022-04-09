import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../api/http_service_cards.dart';
import '../../../akila/constants.dart';

class UpdatePinAlertBox extends StatefulWidget {
  BuildContext parentContext;
  int pin;
  String id;
  UpdatePinAlertBox({Key? key, required this.parentContext, required this.pin, required this.id}) : super(key: key);
  @override
  _UpdatePinAlertBoxState createState() => _UpdatePinAlertBoxState(parentContext ,pin, id);
}

class _UpdatePinAlertBoxState extends State<UpdatePinAlertBox> {
  BuildContext parentContext;
  int pin;
  int? _currentPin;
  String? _accessKey;
  int? _newPin;
  int? _confirmPin;
  String id;
  _UpdatePinAlertBoxState(this.parentContext, this.pin, this.id);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
          'Update Pin',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Image.asset(
                        "assets/images/pass.gif",
                      height: 160,
                    )
                ),
              ],
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
                        labelText: 'Access Key',
                      ),
                      onChanged: (String? value){
                        if(value != null && value.isNotEmpty){
                          setState(() {
                            _accessKey = value;
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
                        labelText: "Current Pin No",
                      ),
                      onChanged: (String? value){
                        if(value != null && value.isNotEmpty){
                          setState(() {
                            _currentPin = int.parse(value);
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
                        labelText: "New Pin No",
                      ),
                      onChanged: (String? value){
                        if(value != null && value.isNotEmpty){
                          setState(() {
                            _newPin = int.parse(value);
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
                        labelText: "Confirm New Pin No",
                      ),
                      onChanged: (String? value){
                        if(value != null && value.isNotEmpty){
                          setState(() {
                            _confirmPin = int.parse(value);
                          });
                        }
                      },
                    )
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                primary: kPrimaryColor2
            ),
            child: const Text(
                'Update Pin',
              style: TextStyle(
                fontSize: 18,
            ),
            ),
            onPressed: () async {
              if(_accessKey == null || _currentPin == null || _newPin == null || _confirmPin == null){
                print(_accessKey);
                Fluttertoast.showToast(
                    msg: "Please Fill the required fields",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              else if(_currentPin != pin){
                Fluttertoast.showToast(
                    msg: "Please Enter the Valid Pin No",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              else if(_confirmPin != _newPin){
                Fluttertoast.showToast(
                    msg: "Pin Numbers are not matching",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              else{
                HttpServiceCard service = HttpServiceCard();
                await service.updatePin(id, _newPin.toString(), context);
              }
            },
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
