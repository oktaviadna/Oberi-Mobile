import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:oberi_mobile/ui/widgets/sky_widget_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'determine_upload_item.dart';

class TestUploadingView extends GetView<TestUploadController> {
  const TestUploadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestUploadController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Uploading ${controller.pickedFile?.length} files',
                  style: AppStyle.body2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SkyImage(
                  onTapImage: () {
                    controller.onShowDetailUpload();
                  },
                  src: 'assets/images/ic_maximize.svg',
                )
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              runAlignment: WrapAlignment.start,
              children: List.generate(
                controller.pickedFile?.length ?? 0,
                (index) {
                  final item = controller.pickedFile?[index];
                  return DetermineUploadItem(item: item);
                },
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => LinearPercentIndicator(
                padding: EdgeInsets.zero,
                barRadius: const Radius.circular(30),
                backgroundColor: AppColors.onPrimary.withOpacity(0.4),
                progressColor: AppColors.primary,
                percent: controller.isUploading
                    ? (controller.dummyMaxUploadTime.toDouble() -
                            double.parse(controller.currTimeTimer.value)) /
                        controller.dummyMaxUploadTime.value
                    : 0,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Time Remaining: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Obx(
                      () => Text(
                        '${controller.currTimeTimer.value} sec.',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Obx(
                      () => SkyWidgetButton(
                        borderRadius: 4.5,
                        color: Colors.grey,
                        icon: (controller.isPausedUpload.isTrue)
                            ? Icons.play_arrow
                            : Icons.pause,
                        onPressed: () {
                          controller.onPauseResumeUpload();
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    SkyWidgetButton(
                      borderRadius: 4.5,
                      color: Colors.red.withOpacity(0.2),
                      icon: Icons.close,
                      iconColor: AppColors.failed,
                      onPressed: () {
                        controller.onCancelUpload();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
