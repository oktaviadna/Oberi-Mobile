import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({
    Key? key,
    required this.isShow,
    required this.text,
    required this.color,
    this.height,
    required this.onTap,
  }) : super(key: key);

  final bool isShow;
  final String text;
  final Color color;
  final double? height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: isShow ? height : 0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: AppStyle.body1.copyWith(color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
