import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/pwds/secure_password_home.dart';
import 'package:splashscreen/splashscreen.dart';

import 'constants.dart';

class secure_pwd_splash extends StatelessWidget {
  const secure_pwd_splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      // backgroundColor: Color.fromARGB(255, 144, 184, 170),
      seconds: 6,
      navigateAfterSeconds: secure_password_home(),
      title: const Text(
        'Secure Passwords',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/sec pwd.gif'),
      loadingText: const Text("Loading..."),
      photoSize: 100.0,
      loaderColor: kPrimaryColor,
    );
  }
}
