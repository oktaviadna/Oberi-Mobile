import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'picker_chip.dart';
import 'picker_data.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/

enum ListPickerType {
  single,
  multiple,
  radio,
}

typedef SMFilterItemBuilder<T> = Widget Function(
  T item,
);

typedef SMFilterOnChanged<T> = Function(
  BuildContext context,
  int index,
  T? firstItem,
  List<T?> listItem,
);

class PickerListView<T> extends StatelessWidget {
  const PickerListView({
    Key? key,
    required this.type,
    required this.data,
    required this.itemBuilder,
    required this.onChanged,
    this.widthItem,
    this.heightItem,
    this.shrinkWrap = false,
    this.physics,
    this.separator,
    this.initialValue,
    this.scrollDirection = Axis.vertical,
    this.padding,
  }) : super(key: key);

  final ListPickerType type;
  final List<PickerData<T>> data;
  final SMFilterItemBuilder<PickerData<T>> itemBuilder;
  final SMFilterOnChanged<T> onChanged;
  final double? widthItem;
  final double? heightItem;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? separator;
  final PickerData<T>? initialValue;
  final Axis scrollDirection;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    _setInitial();
    RxList<PickerData<T>> tempData = data.obs;
    return Obx(
      () => ListView.separated(
        padding: padding,
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemCount: tempData.length,
        scrollDirection: scrollDirection,
        separatorBuilder: (BuildContext context, int index) {
          return separator ?? const SizedBox.shrink();
        },
        itemBuilder: (context, index) {
          final item = tempData[index];
          return PickerChip(
            selected: item.isSelected,
            isRadio: type == ListPickerType.radio,
            onSelected: (bool isSelected) {
              if (type != ListPickerType.multiple) {
                for (var element in tempData) {
                  element.isSelected = false;
                }
              }
              tempData.value = tempData.map(
                (otherChip) {
                  return item == otherChip
                      ? otherChip.copy(isSelected: isSelected)
                      : otherChip;
                },
              ).toList();
              onChanged(
                context,
                index,
                tempData
                    .firstWhereOrNull(
                        (element) => element.isSelected && element.isAvailable)
                    ?.data,
                tempData
                    .where(
                        (element) => element.isSelected && element.isAvailable)
                    .map((e) => e.data)
                    .toList(),
              );
            },
            child: itemBuilder(item),
          );
        },
      ),
    );
  }

  void _setInitial() {
    if (data.isNotEmpty) {
      if (initialValue != null) {
        int index =
            data.indexWhere((element) => element.data == initialValue?.data);
        data[index] = PickerData(
          isSelected: true,
          index: initialValue?.index,
          data: initialValue?.data,
        );
      }
    }
  }
}
