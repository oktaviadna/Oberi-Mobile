import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/chat/chat_controller.dart';
import 'package:oberi_mobile/ui/views/chat/widgets/chat_list_view.dart';
import 'package:oberi_mobile/ui/views/chat/widgets/chat_scaffold.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

import 'components/chat_bottom_bar.dart';
import 'widgets/chat_date_info.dart';

class ChatView extends GetView<ChatController> {
  static const String route = '/chat';

  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.systemBgLight,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black54),
          ),
        ],
        leadingWidth: Get.width,
        leading: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                color: Colors.black54,
              ),
              SkyImage(
                src: 'https://picsum.photos/200/300.jpg',
                borderRadius: BorderRadius.circular(30),
                height: 47,
                width: 47,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.args['mentor'],
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: AppStyle.subtitle4.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Online',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: AppStyle.body3.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyRFQMessageScreenBottom(),
      body: GetBuilder<ChatController>(
        builder: (controller) {
          return Stack(
            children: [
              SkyImage(
                src: 'assets/images/bg_chat.png',
                width: Get.width,
                height: Get.height,
                fit: BoxFit.cover,
              ),
              ChatListView<Map<String, dynamic>>(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                elements: controller.dataList.reversed.toList(),
                controller: controller.scrollCtr,
                reverse: true,
                groupHeaderBuilder: (sendTime) =>
                    ChatDateInfo(sendTime: sendTime),
                itemBuilder: (context, index, Map<String, dynamic> message) =>
                    ChatScaffoldWidget(data: message),
                groupBy: (Map<String, dynamic> element) =>
                    DateTime.parse(element['created_at']),
              ),
            ],
          );
        },
      ),
    );
  }
}
