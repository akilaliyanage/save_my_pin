import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/secure_notes_home.dart';
import 'package:splashscreen/splashscreen.dart';

class secure_pwd_splash extends StatelessWidget {
  const secure_pwd_splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: secure_notes_home(),
      title: const Text(
        'Secure Password',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/sec pwd.gif'),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Color.fromARGB(255, 243, 75, 33),
    );
  }
}
