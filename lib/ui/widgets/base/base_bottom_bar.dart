import 'package:flutter/material.dart';

class BaseBottomBar extends StatelessWidget {
  const BaseBottomBar({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: child,
    );
  }
}
