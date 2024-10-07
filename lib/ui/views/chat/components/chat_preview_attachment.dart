import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/chat/chat_controller.dart';

import '../chat_attachment_controller.dart';
import 'chat_preview_box_add_attachment.dart';
import 'chat_preview_attachment_item.dart';

class ChatPreviewAttachment extends StatelessWidget {
  const ChatPreviewAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatAttachmentController>(builder: (controller) {
      if (controller.files.isNotEmpty) {
        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Row(
                      children: List.generate(
                        controller.files.length,
                        (index) => ChatPreviewAttachmentItem(
                          data: controller.files[index],
                          index: index,
                          deleteOnTap: () =>
                              controller.deleteFileByIndex(index),
                        ),
                      ),
                    ),
                    GetBuilder<ChatController>(
                      builder: (controller) {
                        return InkWell(
                          onTap: () {
                            controller.attachMedia();
                          },
                          child: const ChatPreviewBoxAddAttachment(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      } else {
        return const SizedBox(height: 0);
      }
    });
  }
}
