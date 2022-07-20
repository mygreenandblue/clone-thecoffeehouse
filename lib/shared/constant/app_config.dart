import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfig {
  String? appName;
  String? apiHost;
  String? apiUrl;
  String? apiVersion;
  String? apiKey;
  double? heightScreen;
  double? widthScreen;
  String? env;
  String? dbVersion;
  String? shelfSutraSiteId;
  String? bonManagerSiteId;
  String? believerSiteId;
  String? googleMapApi;
  String? qrcode;
  String? apiKeyMap;
  String? hostGoogle;
  String? pathGoogle;

  GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();

  static final AppConfig _appConfig =  AppConfig._internal();

  Future<void> forEnvironment(String env) async {
    // load the json file
    env = env;

    final contents = await rootBundle.loadString(
      'assets/configs/$env.json',
    );

    // decode our json
    // ignore: unused_local_variable
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
  }

  factory AppConfig() {
    return _appConfig;
  }
  AppConfig._internal();
}

final appConfig = AppConfig();
