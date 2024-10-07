
import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/extensions/date_extension.dart';

class ChatListView<T> extends StatelessWidget {
  const ChatListView({
    Key? key,
    required this.groupHeaderBuilder,
    required this.elements,
    required this.itemBuilder,
    this.controller,
    this.reverse = true,
    required this.groupBy,
    this.padding,
  }) : super(key: key);

  final List<T> elements;
  final Widget Function(DateTime element) groupHeaderBuilder;
  final Widget Function(BuildContext context, int index, T element) itemBuilder;
  final ScrollController? controller;
  final bool reverse;
  final DateTime Function(T element) groupBy;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding ?? const EdgeInsets.all(0),
      itemCount: elements.length,
      controller: controller,
      reverse: reverse,
      itemBuilder: (_, index) {
        bool isSameDate = true;
        final DateTime date = groupBy(elements[index]);

        DateTime? prevDate;
        if (index != 0) {
          prevDate = groupBy(elements[index - 1]);
          isSameDate = date.isSameDay(prevDate);
        } else {
          prevDate = date;
          isSameDate = date.isSameDay(prevDate);
        }

        if (reverse) {
          return Column(
            children: [
              if (index + 1 == elements.length) groupHeaderBuilder(date),
              itemBuilder(context, index, elements[index]),
              if (!isSameDate) groupHeaderBuilder(prevDate),
            ],
          );
        } else {
          return Column(
            children: [
              if (!isSameDate) groupHeaderBuilder(prevDate),
              itemBuilder(context, index, elements[index]),
              if (index + 1 == elements.length) groupHeaderBuilder(date),
            ],
          );
        }
      },
    );
  }
}