import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class PickerChip extends StatelessWidget {
  const PickerChip({
    Key? key,
    required this.onSelected,
    required this.child,
    required this.selected,
    this.isRadio = false,
  }) : super(key: key);

  final void Function(bool) onSelected;
  final Widget child;
  final bool selected;
  final bool isRadio;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        if (selected) {
          if (!isRadio) onSelected(false);
        } else {
          onSelected(true);
        }
      },
      child: child,
    );
  }
}