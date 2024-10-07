import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';

class MessageTime extends StatelessWidget {
  final Map<String, dynamic> data;
  final MainAxisAlignment mainAxisAlignment;
  final bool sendByMe;

  const MessageTime({
    Key? key,
    required this.data,
    required this.mainAxisAlignment,
    required this.sendByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('HH:mm')
          .format(DateTime.parse(data['created_at']).toLocal()),
      style: AppStyle.body2.copyWith(
        color: sendByMe ? Colors.white : Colors.grey,
      ),
    );
  }
}
