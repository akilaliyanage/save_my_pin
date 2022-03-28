import 'package:flutter/material.dart';
import '../../../pwds/constants.dart';

class CardHeader extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CardHeader({required this.size, required this.title, required this.image,});

  final Size size;
  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      // It will cover 20% of our total height
      height: size.height * 0.1,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
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
                  title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                image
              ],
            ),
          ),
        ],
      ),
    );
  }
}
