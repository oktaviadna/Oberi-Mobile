import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';

class ColoredStatusBar extends StatelessWidget {
  const ColoredStatusBar({
    Key? key,
    this.color,
    this.child,
    this.brightness = Brightness.dark,
    this.bottomSafe,
  }) : super(key: key);

  final Color? color;
  final Widget? child;
  final Brightness brightness;
  final bool? bottomSafe;

  @override
  Widget build(BuildContext context) {
    const defaultColor = AppColors.primary;
    Brightness iconBrightness;
    if (Platform.isIOS) {
      (brightness == Brightness.dark)
          ? iconBrightness = Brightness.light
          : iconBrightness = Brightness.dark;
    } else {
      iconBrightness = brightness;
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color ?? defaultColor,
        statusBarIconBrightness: iconBrightness,
        statusBarBrightness: iconBrightness,
      ),
      child: Container(
        color: color ?? defaultColor,
        child: SafeArea(
          top: true,
          bottom: bottomSafe ?? true,
          child: Container(
            child: child,
          ),
        ),
      ),
    );
  }
}
