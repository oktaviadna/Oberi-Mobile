import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  // General
  static const Color primary = Color(0xff5053EA);
  static const Color primaryVariant = Color(0xff6D70ED);
  static const Color onPrimary = Color(0xffC7C7F2);
  static const Color secondary = Color(0xff0EB6CC);
  static const Color secondaryVariant = Color(0xff53d4ff);
  static const Color accent = Color(0xff4686E7);

  // Dialog
  static const Color info = secondary;
  static const Color success = Color(0xff18CE18);
  static const Color failed = Color(0xffE33131);
  static const Color failedSecondary = Color(0xffFFEDED);

  // Tier
  static const Color silver = Color(0xffCACACA);
  static const Color gold = Color(0xffEB9525);
  static const Color platinum = Color(0xff555555);


  // System
  static const Color systemGrey = Color(0xffF1F1F1);
  static const Color systemBlack = Color(0xff141414);
  static const Color systemDarkGrey = Color(0xff9e9e9e);
  static const Color systemBgDark = Color(0xff303030);
  static const Color systemBgLight = Color(0xffFAFAFA);
  static const Color subtitleText = Color(0xff504F5E);
  Color containerThemeColor = (Get.isDarkMode)
      ? Get.context!.theme.dialogBackgroundColor
      : systemGrey;

  // Dark Mode
  static const Color baseDark = Color(0xff303030);
  static const Color baseLight = Color(0xffFAFAFA);

  // Material Color
  static Map<int, Color> color = {
    50: const Color.fromRGBO(255, 255, 255, 1.0),
    100: const Color.fromRGBO(255, 255, 255, 0.9294117647058824),
    200: const Color.fromRGBO(255, 255, 255, 1.0),
    300: const Color.fromRGBO(213, 209, 211, 1.0),
    400: const Color.fromRGBO(199, 198, 199, 1.0),
    500: const Color.fromRGBO(179, 175, 177, 1.0),
    600: const Color.fromRGBO(156, 155, 156, 1.0),
    700: const Color.fromRGBO(139, 136, 137, 1.0),
    800: const Color.fromRGBO(68, 68, 68, 1.0),
    900: const Color.fromRGBO(45, 45, 45, 1.0),
  };
  static MaterialColor materialPrimary = MaterialColor(0xff009cc6, color);
}
