import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';

class MessageText extends StatelessWidget {
  final String text;
  final bool isByMe;

  const MessageText({
    Key? key,
    required this.text,
    required this.isByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.body1.copyWith(
        fontWeight: FontWeight.w400,
        color: isByMe ? Colors.white : Colors.black,
      ),
    );
  }
}
