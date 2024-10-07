import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';

class ChatPreviewBoxAddAttachment extends StatelessWidget {
  const ChatPreviewBoxAddAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [7],
      radius: const Radius.circular(4),
      borderType: BorderType.RRect,
      color: Colors.grey,
      child: SizedBox(
        width: 90,
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: AppColors.primary,
              size: 34,
            ),
            const SizedBox(height: 8),
            Text(
              'Add File',
              textAlign: TextAlign.center,
              style: AppStyle.subtitle4,
            ),
          ],
        ),
      ),
    );
  }
}
