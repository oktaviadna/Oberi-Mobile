// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:oberi_mobile/ui/views/chat/chat_controller.dart';
import 'package:oberi_mobile/ui/views/chat/model/file_attachments.dart';
import 'package:oberi_mobile/ui/views/chat/widgets/chat_bubble.dart';

import 'message_file.dart';
import 'message_text.dart';

class ChatScaffoldWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  late CrossAxisAlignment crossAxisAlignment;
  late MainAxisAlignment mainAxisAlignment;
  late BorderRadius borderRadius;

  ChatScaffoldWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  bool isByMe() {
    ChatController myRFQMessageScreenController = ChatController.find;
    return myRFQMessageScreenController
        .isMessageFromSender(data['user_id'] ?? -1);
  }

  void defineVariable() {
    if (isByMe()) {
      crossAxisAlignment = CrossAxisAlignment.end;
      mainAxisAlignment = MainAxisAlignment.end;
      borderRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        topLeft: Radius.circular(15),
      );
    } else {
      crossAxisAlignment = CrossAxisAlignment.start;
      mainAxisAlignment = MainAxisAlignment.start;
      borderRadius = const BorderRadius.only(
        bottomRight: Radius.circular(15),
        topRight: Radius.circular(15),
        topLeft: Radius.circular(15),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    defineVariable();

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        const SizedBox(height: 4),
        if (data['message_files']!.isNotEmpty) ...[
          _messageListBuilder(isByMe()),
          const SizedBox(height: 6),
        ],
        if (data['content'] != null && data['content'].trim() != '') ...[
          _messageTextBuilder(isByMe()),
          const SizedBox(height: 6),
        ],
      ],
    );
  }

  Widget _messageListBuilder(bool isByMe) {
    List<FileAttachment> attachments =
        data['media'] != null && data['media'].length != 0
            ? List<FileAttachment>.from(data['media'].map(
                (model) => FileAttachment.fromJson(model),
              ))
            : [];

    return ListView.separated(
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: attachments.length,
      itemBuilder: (_, index) => _cardBuilder(
        child: MessageFile(
          data: attachments[index],
        ),
        isByMe: isByMe,
      ),
      separatorBuilder: (_, index) => const Divider(
        color: Colors.transparent,
        height: 6,
      ),
    );
  }

  Widget _messageTextBuilder(bool isByMe) {
    return _cardBuilder(
      child: MessageText(
        text: data['content'],
        isByMe: isByMe,
      ),
      isByMe: isByMe,
    );
  }

  Widget _cardBuilder({required Widget child, required bool isByMe}) {
    return ChatBubble(
      isByMe: isByMe,
      borderRadius: borderRadius,
      crossAxisAlignment: crossAxisAlignment,
      data: data,
      mainAxisAlignment: mainAxisAlignment,
      child: child,
    );
  }
}
