import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/secure_notes_home.dart';
import 'package:splashscreen/splashscreen.dart';

class secure_notes_splash extends StatelessWidget {
  const secure_notes_splash
({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: secure_notes_home(),
      title: const Text('Secure Notes',textScaleFactor: 2,),
      image: Image.asset('assets/images/secure_note.gif'),
      loadingText: const Text("Loading your all secure notes, Please Wait!!"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}