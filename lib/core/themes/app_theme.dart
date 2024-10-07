import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.materialPrimary,
      primarySwatch: AppColors.materialPrimary,
      indicatorColor: AppColors.accent,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      inputDecorationTheme: inputDecorationTheme(),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primarySwatch: AppColors.materialPrimary,
      primaryColor: AppColors.materialPrimary,
      indicatorColor: AppColors.accent,
      fontFamily: "Poppins",
      brightness: Brightness.dark,
      inputDecorationTheme: inputDecorationTheme(),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.materialPrimary;
          }
          return null;
        }),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  static setStatusBar({
    required Brightness brightness,
    Color color = AppColors.primary,
  }) {
    Brightness iconBrightness;
    if (Platform.isIOS) {
      (brightness == Brightness.dark)
          ? iconBrightness = Brightness.light
          : iconBrightness = Brightness.dark;
    } else {
      iconBrightness = brightness;
    }
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: iconBrightness,
        statusBarIconBrightness: iconBrightness,
        statusBarColor: color,
      ),
    );
  }
}

extension DarkMode on BuildContext {
  bool isDarkMode() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

class AppOrientation {
  static lock(DeviceOrientation orientation) {
    return SystemChrome.setPreferredOrientations([
      orientation,
    ]);
  }
}
