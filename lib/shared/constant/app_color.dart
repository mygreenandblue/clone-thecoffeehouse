import 'package:flutter/material.dart';

class AppColor {
  static final AppColor _appColor = AppColor._internal();

  static Color primary = const Color.fromRGBO(62, 160, 176, 1);
  static Color topSpace = const Color.fromRGBO(231, 237, 237, 1);
  static Color textFieldColor = const Color.fromRGBO(143, 193, 199, 1);
  // static Color primary = Color(0xff1A89B9);
  static Color sideBarColor = const Color.fromRGBO(26, 137, 185, 0.81);
  static Color bgColorError = const Color(0xffC32323);
  static Color bgColorInfo = const Color(0xff26953E);
  static Color bgError = const Color(0xffFFE1E1);
  static Color bgColorWarning = const Color(0xffE29500);
  static Color grey98 = const Color(0xffFAFAFA);
  static Color white = const Color(0xffFFFFFF);
  static Color orange = const Color(0xffF3AC21);
  static Color secondary = const Color(0xff8BBE4A);
  static Color red = const Color(0xffCF2F2F);
  static Color darkRed = const Color(0xffE10000);
  static Color grey63 = const Color(0xffA1A1A1);
  static Color lightOrange = const Color(0xffFFE8DB);
  static Color charcoal = const Color(0xff454545);
  static Color grey46 = const Color(0xff757575);
  static Color grey90 = const Color(0xffE5E5E5);
  static Color moonstone = const Color.fromARGB(255, 158, 181, 192);
  static Color blue = const Color(0xff2175F3);
  static Color transparent = Colors.transparent;
  static Color tabActive = const Color(0xff4CBD80);
  static Color tabInactive = const Color(0xffB7B7B7);
  static Color lightRed = const Color(0xffEAEAEA);
  static Color black = const Color(0xff000000);
  static Color seaShell = const Color(0xffFFF8F4);
  static Color grey = const Color(0xffA2A2A2);
  static Color gainsBoro = const Color(0xffDCDCDC);
  static Color farbe = const Color.fromRGBO(70, 160, 198, 0.1);
  static Color seaShell1 = const Color(0xffFFF4EE);
  static Color lightGrey = const Color(0xffEFEFEF);
  static Color baliHai = const Color(0xff919A9F);
  static Color grey76 = const Color(0xffC2C2C2);
  static Color green = Colors.green;
  static Color patternsBlue = const Color(0xffD7EDF7);
  static Color whiteSmoke = const Color(0xffF5F5F5);
  static Color whiteSmoke1 = const Color(0x00f8f8f8);
  static Color pacificBlue = const Color(0xffD7EDF6);
  static Color yellow = const Color(0xffF3AC21);
  static Color btnActive = const Color.fromARGB(255, 17, 131, 63);
  static Color backgroundActive = const Color(0xffD5F4E1);
  static Color headerTitleBackground = const Color(0xffECF5F9);
  factory AppColor() {
    return _appColor;
  }
  AppColor._internal();
}
