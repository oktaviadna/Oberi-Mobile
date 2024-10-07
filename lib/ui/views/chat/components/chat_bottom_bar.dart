import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/chat/chat_controller.dart';
import 'package:oberi_mobile/ui/widgets/keyboard_dismisser.dart';
import 'package:oberi_mobile/ui/widgets/sky_form_field.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

import 'chat_preview_attachment.dart';

class MyRFQMessageScreenBottom extends GetView<ChatController> {
  const MyRFQMessageScreenBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ChatPreviewAttachment(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.attachMedia();
                    },
                    child: const SkyImage(src: 'assets/images/ic_clip.svg'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GetBuilder<ChatController>(
                      builder: (controller) {
                        return SkyFormField(
                          controller: controller.textController,
                          hint: 'Tulis pesan',
                          style: AppStyle.body1,
                          hintStyle: AppStyle.body1,
                          backgroundColor: Colors.grey.shade100,
                          disableBorder: true,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      controller.sendMessage();
                    },
                    child: const SkyImage(src: 'assets/images/ic_send.svg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
