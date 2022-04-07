import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/card/providers/device_provider.dart';
//import 'package:save_my_pin/pages/akila/secure_notes_home.dart';
import 'package:splashscreen/splashscreen.dart';

import '../pwds/constants.dart';
import 'my_cards.dart';

class secure_cards_splash extends StatelessWidget {
  static const String routeName = '/secure_cards_splash';
  const secure_cards_splash
      ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
      // backgroundColor: Color.fromARGB(255, 144, 184, 170),
      seconds: 6,
      navigateAfterSeconds: my_cards(),
      title: const Text(
        'Secure Cards',
        textScaleFactor: 2,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      image: Image.asset(
          'assets/images/creditCard.gif',
        height: DeviceProvider.deviceHeight(context) * 0.6,
        width: DeviceProvider.deviceWidth(context) * 5,
      ),
      loadingText: const Text("We are getting your secure cards, Please Wait..."),
      photoSize: 210.0,
      loaderColor: kPrimaryColor,
    );
  }
}