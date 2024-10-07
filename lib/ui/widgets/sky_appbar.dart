import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';

import 'base/base_appbar.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
abstract class SkyAppBar {
  /// Use [SkyAppBar.primary] as a default AppBar globally.
  /// * Can edited for specific requirement.
  static PreferredSizeWidget primary({
    String? title,
    Color? backgroundColor,
    Color? iconColor,
    List<Widget>? action,
    bool? centerTitle = true,
    double elevation = 1,
    Widget? leading,
  }) {
    return BaseAppBar(
      leading: leading,
      title: title,
      action: action,
      backgroundColor: backgroundColor ?? Colors.white,
      titleStyle: AppStyle.subtitle3.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      elevation: elevation,
      centerTitle: centerTitle,
      iconColor: iconColor ?? Colors.black,
    );
  }

  /// Use [SkyAppBar.chat] as an AppBar for Chat Pages.
  /// * Can edited for specific requirement.
  static PreferredSizeWidget chat({
    String? title,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    List<Widget>? action,
    bool? centerTitle,
    PreferredSizeWidget? bottom,
    Widget? leading,
  }) {
    return BaseAppBar(
      title: title,
      centerTitle: centerTitle ?? true,
      action: action,
      backgroundColor: backgroundColor ?? Colors.white,
      titleStyle: TextStyle(color: textColor),
      iconColor: iconColor ?? Colors.black54,
      bottom: bottom,
      leading: leading,
    );
  }

  static PreferredSizeWidget intro({
    String? title,
    Color? backgroundColor,
    Color? iconColor,
    List<Widget>? action,
    bool? centerTitle = false,
  }) {
    return BaseAppBar(
      title: title,
      action: action,
      backgroundColor:
          backgroundColor ?? Theme.of(Get.context!).scaffoldBackgroundColor,
      titleStyle: AppStyle.subtitle4.copyWith(color: AppColors.primary),
      elevation: 0,
      centerTitle: centerTitle,
      iconColor: iconColor ?? AppColors.systemDarkGrey,
    );
  }

  ///
  /// Add other AppBar if needed.
  ///
}
