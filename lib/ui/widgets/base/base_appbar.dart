import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    this.title,
    this.action,
    this.backgroundColor,
    this.centerTitle = false,
    this.titleStyle,
    this.iconColor,
    this.elevation,
    this.height,
    this.iconSize,
    this.bottom, this.leading,
  }) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final List<Widget>? action;
  final bool? centerTitle;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final double? elevation;
  final double? height;
  final double? iconSize;
  final PreferredSizeWidget? bottom;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        title ?? '',
        style: titleStyle,
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: action,
      bottom: bottom,
      iconTheme: IconThemeData(color: iconColor, size: iconSize),
      leading: leading,

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
