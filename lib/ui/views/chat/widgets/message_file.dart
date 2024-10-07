import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/file_helper.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/chat/chat_controller.dart';
import 'package:oberi_mobile/ui/views/chat/model/file_attachments.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageFile extends GetView<ChatController> {
  final FileAttachment data;

  const MessageFile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.fileNameWithExtension!.contains('pdf')) {
      return _fileData();
    } else {
      return _imageData();
    }
  }

  Widget _fileData() {
    return InkWell(
      onTap: () {
        bool isFromNetwork = data.fileURL!.startsWith('http');
        if (isFromNetwork) {
          controller.fileOnTap(
            data,
            mode: LaunchMode.externalNonBrowserApplication,
          );
        } else {
          OpenFilex.open(data.fileURL);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const SkyImage(
              src: 'assets/images/ic_clip.svg',
              color: Colors.black,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.fileNameWithExtension!.split('/').last,
                  style: AppStyle.body2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  FileHelper.getFileSizeString(bytes: data.fileSize!),
                  style: AppStyle.body1.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _imageData() {
    bool isFromNetwork = data.fileURL!.startsWith('http');
    return SkyImage(
      src: data.fileURL.toString(),
      fromFile: !isFromNetwork,
      borderRadius: BorderRadius.circular(6),
      enablePreview: true,
      height: 200,
      width: 200,
      onTapImage: () {
        if (!data.fileURL!.startsWith('http')) {
          controller.fileOnTap(data);
        } else {
          OpenFilex.open(data.fileURL);
        }
      },
    );
  }
}
