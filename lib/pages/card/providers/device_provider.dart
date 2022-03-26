import 'package:flutter/cupertino.dart';

class DeviceProvider extends ChangeNotifier{
  static double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double deviceWidth(BuildContext context) => MediaQuery.of(context).size.height;
}