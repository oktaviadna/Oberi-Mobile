import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class BulletText extends StatelessWidget {
  const BulletText({
    Key? key,
    required this.title,
    this.subtitle,
    this.horizontalSpacing = 8,
    this.verticalSpacing = 4,
    this.margin,
    this.padding,
    this.caption, this.iconPadding,
    this.iconSize = 5,
  }) : super(key: key);

  final Widget title;
  final Widget? subtitle;
  final Widget? caption;
  final double horizontalSpacing;
  final double verticalSpacing;
  final double iconSize;
  final EdgeInsetsGeometry? margin, padding, iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: iconPadding ?? EdgeInsets.zero,
                child: Icon(Icons.circle, size: iconSize),
              ),
              SizedBox(width: horizontalSpacing),
              Expanded(child: title),
            ],
          ),
          SizedBox(height: verticalSpacing),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8 + (horizontalSpacing),
            ),
            child: subtitle,
          ),
          SizedBox(height: verticalSpacing / 2),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8 + (horizontalSpacing),
            ),
            child: caption,
          )
        ],
      ),
    );
  }
}
