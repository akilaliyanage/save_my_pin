import 'package:flutter/material.dart';

import '../constants.dart';

class AddNewSecureNoteHdr extends StatelessWidget {
  const AddNewSecureNoteHdr({
    // Key key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 2),
      // It will cover 20% of our total height
      height: size.height * 0.15,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'ADD NEW SECURE NOTE',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
               // Image.asset("assets/images/sec pwd2.gif")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
