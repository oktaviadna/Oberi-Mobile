import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';

import 'message_time.dart';

class ChatBubble extends StatelessWidget {
  final bool isByMe;
  final BorderRadiusGeometry borderRadius;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final Widget child;
  final Map<String, dynamic> data;

  const ChatBubble({
    Key? key,
    this.isByMe = false,
    required this.borderRadius,
    required this.child,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: Get.width * 0.7),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isByMe ? AppColors.primary : AppColors.systemGrey,
            borderRadius: borderRadius,
          ),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              child,
              const SizedBox(height: 8),
              MessageTime(
                data: data,
                mainAxisAlignment: mainAxisAlignment,
                sendByMe: isByMe,
              ),
            ],
          ),
        ),
        Container(),
      ],
    );
  }
}
