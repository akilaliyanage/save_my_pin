import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/secure_notes_home.dart';
import 'package:splashscreen/splashscreen.dart';

class secure_cards_splash extends StatelessWidget {
  static const String routeName = '/secure_cards_splash';
  const secure_cards_splash
      ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffffD8E0FF),
                Color(0xffff0025A8)
              ]
          )
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/creditCard.gif',
                      height: 300.0,
                      width: 350.0,
                    )
                  ],
                ),
            ),
            Expanded(
              flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Secure Cards",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0
                      ),
                    )
                  ],
                ),
            ),
            Expanded(
              flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Loading your all secure cards, Please Wait!!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0
                      ),

                    )
                  ],
                )
            )

          ],
        ),
      ),
    );
  }
}