import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
    required this.text,
    this.leading,
    this.trailing, this.color, this.textColor,
  }) : super(key: key);

  final String text;
  final Widget? leading;
  final Widget? trailing;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Wrap(
        children: [
          if (leading != null) leading!,
          const SizedBox(width: 4),
          Text(
            text,
            style: AppStyle.body2.copyWith(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
