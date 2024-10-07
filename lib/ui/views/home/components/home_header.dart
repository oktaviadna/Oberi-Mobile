import 'package:collection_picker/collection_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/asset_management.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/home/home_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SkyImage(
                src: LocalAsset.profile,
                height: 42,
                width: 42,
                borderRadius: BorderRadius.circular(42),
              ),
              const SizedBox(width: 8),
              Text(
                'Hi, Keyra Putri!',
                style: AppStyle.subtitle3
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const SkyImage(src: 'assets/images/ic_bell.svg'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 30,
          child: ListViewPicker<String>(
            initialValue: controller.filter.first,
            scrollDirection: Axis.horizontal,
            type: PickerType.radio,
            data: controller.filter,
            separator: const SizedBox(width: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onChanged:
                (context, index, selectedItem, selectedListItem) {
              debugPrint('Selected = $selectedItem');
            },
            itemBuilder: (context, index, PickerWrapper<String> item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: (item.isSelected)
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: (!item.isSelected)
                        ? Border.all(color: AppColors.primary, width: 2)
                        : Border.all(
                        color: Colors.transparent, width: 2)),
                child: Center(
                  child: Text(
                    item.data.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: (item.isSelected)
                            ? Colors.white
                            : AppColors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        const Divider(thickness: 1),
      ],
    );
  }
}
