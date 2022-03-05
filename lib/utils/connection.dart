import 'package:flutter_config/flutter_config.dart';

class Connection {
  static late String baseUrl = "http://" + FlutterConfig.get('IP') + ":8080";
}
