import 'package:collection_picker/collection_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/bootcamp_detail_controller.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/widgets/bootcamp_buy_dialog.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/widgets/bootcamp_section.dart';
import 'package:oberi_mobile/ui/widgets/base/sky_dialog.dart';
import 'package:oberi_mobile/ui/widgets/label_widget.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BootcampDetailView extends GetView<BootcampDetailController> {
  static const String route = '/bootcamp-detail';

  const BootcampDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Detail Bootcamp'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkyImage(
              src: 'assets/images/oberi_bootcamp.png',
              width: double.infinity,
              height: 172,
              borderRadius: BorderRadius.circular(9),
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              'Deskripsi',
              style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(controller.args['detail'], style: AppStyle.body2),
            const SizedBox(height: 16),
            SkyButton(
              text: 'Chat Mentor',
              outlineMode: true,
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: Get.context!,
                  builder: (context) => const SkyDialog(
                    child: BootcampBuyDialog(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.unlock,
              text: 'Free Course',
              childExpand: ListViewPicker(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                type: PickerType.multiple,
                data: controller.freeCourseData,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.data['title'],
                                        style: AppStyle.body1.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        item.data['description'],
                                        style: AppStyle.body2.copyWith(
                                            fontWeight: FontWeight.w400),
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
                            return Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 24.0,
                                  lineWidth: 3.0,
                                  percent:
                                      cardItem['count'] / cardItem['total'],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
              ),
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.lock,
              text: controller.args['title'],
              labelWidget: const LabelWidget(
                color: Color(0xffcacaca),
                text: 'Silver',
                textColor: Colors.black,
                trailing: SkyImage(
                  src: 'assets/images/ic_check_silver.svg',
                  color: Colors.black,
                  height: 18,
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.lock,
              text: controller.args['title'],
              labelWidget: const LabelWidget(
                color: AppColors.gold,
                text: 'Gold',
                textColor: Colors.white,
                trailing: SkyImage(
                  src: 'assets/images/ic_check_gold.svg',
                  height: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.lock,
              text: controller.args['title'],
              labelWidget: const LabelWidget(
                color: AppColors.platinum,
                text: 'Platinum',
                textColor: Colors.white,
                trailing: SkyImage(
                  src: 'assets/images/ic_check_platinum.svg',
                  color: Colors.white,
                  height: 18,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
