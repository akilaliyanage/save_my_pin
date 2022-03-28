import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/secure_note_home.dart';
import 'package:splashscreen/splashscreen.dart';

import 'constants.dart';

class secure_note_splash extends StatelessWidget {
  const secure_note_splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      // backgroundColor: Color.fromARGB(255, 144, 184, 170),
      seconds: 6,
      navigateAfterSeconds: secure_note_home(),
      title: const Text(
        'Secure Notes',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/secure_note.gif'),
      loadingText: const Text("Loading your secure notes, Please Wait..."),
      photoSize: 100.0,
      loaderColor: kPrimaryColor,
    );
  }
}
