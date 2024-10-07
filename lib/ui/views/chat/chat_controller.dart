import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/data/dummy/chat/chat_data.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chat_attachment_controller.dart';
import 'model/file_attachments.dart';

class ChatController extends GetxController {
  static ChatController find = Get.find();
  String tag = 'ChatController : ';

  TextEditingController textController = TextEditingController();
  final ScrollController scrollCtr = ScrollController();
  RxList<Map<String, dynamic>> dataList = RxList<Map<String, dynamic>>([]);

  int userId = 94;
  late Map<String, dynamic> args;

  @override
  void onInit() {
    args = Get.arguments;
    dataList.value = chatDummyData;
    super.onInit();
  }

  final _chatAttachmentController = Get.put(
    ChatAttachmentController(
      givenAllowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
      givenFileType: FileType.custom,
    ),
  );

  Future<void> attachMedia() async {
    await _chatAttachmentController.pickFile();
  }

  void sendMessage() {
    if (_chatAttachmentController.files.isNotEmpty) {
      dataList.add(
        {
          "id": 99,
          "user_id": userId,
          "user_name": "",
          "content": null,
          "created_at": DateTime.now().toIso8601String(),
          "message_files": [
            ..._chatAttachmentController.files,
          ],
          "media": [
            {
              "name": basename(_chatAttachmentController.files.first.path)
                  .split('.')
                  .firstOrNull,
              "file_name": basename(_chatAttachmentController.files.first.path),
              "size": _chatAttachmentController.files.firstOrNull?.lengthSync(),
              "created_at": "2023-05-08T04:24:12.000000Z",
              "original_url": _chatAttachmentController.files.firstOrNull?.path,
            },
          ]
        },
      );
    } else {
      dataList.add(
        {
          "id": 96,
          "user_id": userId,
          "user_name": "",
          "content": textController.text,
          "created_at": DateTime.now().toIso8601String(),
          "message_files": [],
          "media": []
        },
      );
    }
    update();
    textController.clear();
    _chatAttachmentController.deleteFiles();
  }

  bool isMessageFromSender(int id) {
    return userId == id;
  }

  Future<void> fileOnTap(FileAttachment data,
      {LaunchMode mode = LaunchMode.platformDefault}) async {
    Uri uri = Uri.parse(data.fileURL.toString());

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: mode);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> onScrollUp() async {
    double maxScroll = scrollCtr.position.maxScrollExtent;
    double currentScroll = scrollCtr.position.pixels;
    // if (currentScroll == maxScroll && isSuccess) {
    //   if (hasNext.isTrue) {
    //     LoadingDialog.show();
    //     // await loadNextPage();
    //     LoadingDialog.dismiss();
    //   }
    // }
  }
}
