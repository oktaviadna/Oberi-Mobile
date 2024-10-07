import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/extensions/date_extension.dart';

class ChatDateInfo extends StatelessWidget {
  const ChatDateInfo({Key? key, required this.sendTime}) : super(key: key);
  final DateTime sendTime;

  String _dateDisplay() {
    if (sendTime.isToday()) {
      return 'Hari ini';
    } else if (sendTime.isYesterday()) {
      return 'Kemarin';
    } else if (sendTime.inLastWeek()) {
      return DateFormat('EEEE').format(sendTime);
    } else if (sendTime.inThisYear()) {
      return DateFormat('dd MMM').format(sendTime);
    } else {
      return DateFormat('dd MMM y').format(sendTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: 40,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                _dateDisplay(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
