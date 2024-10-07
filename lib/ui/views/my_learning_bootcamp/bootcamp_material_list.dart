import 'package:collection_picker/collection_picker.dart';
import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BootcampMaterialList extends StatelessWidget {
  const BootcampMaterialList({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  final List<dynamic> data;
  final Function(dynamic) onTap;

  @override
  Widget build(BuildContext context) {
    return ListViewPicker(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      type: PickerType.multiple,
      data: data,
      separator: const Divider(),
      onChanged: (context, index, selectedItem, selectedListItem) {},
      itemBuilder: (context, index, PickerWrapper<dynamic> item) {
        return Column(
          children: [
            Row(
              children: [
                SkyImage(
                  src: item.data['image'],
                  height: 55,
                  width: 55,
                  borderRadius: BorderRadius.circular(6),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: (item.isSelected)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.data['title'],
                              style: AppStyle.body1
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              item.data['description'],
                              style: AppStyle.body2
                                  .copyWith(fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      : Text(
                          item.data['description'],
                          style: AppStyle.body2
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                ),
                const Spacer(),
                item.isSelected
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            if (item.isSelected) ...[
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: item.data['chapters'].length,
                itemBuilder: (context, index) {
                  final cardItem = item.data['chapters'][index];
                  return InkWell(
                    onTap: () {
                      onTap(cardItem);
                    },
                    child: Row(
                      children: [
                        CircularPercentIndicator(
                          radius: 24.0,
                          lineWidth: 3.0,
                          percent: cardItem['count'] / cardItem['total'],
                          center: Text(
                            '${(cardItem['count'] / cardItem['total'] * 100).toInt()}%',
                            style: AppStyle.subtitle4.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          progressColor: AppColors.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardItem['title'],
                                style: AppStyle.subtitle4.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${cardItem['count']}/${cardItem['total']}',
                                style: AppStyle.body2
                                    .copyWith(color: Colors.black54),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ],
          ],
        );
      },
    );
  }
}
