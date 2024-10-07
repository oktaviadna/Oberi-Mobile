import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/file_helper.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_widget_button.dart';
import 'package:path/path.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'determine_upload_item.dart';

class DialogTestDetailUpload extends GetView<TestUploadController> {
  const DialogTestDetailUpload({Key? key, this.data}) : super(key: key);

  final List<File>? data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestUploadController>(
      builder: (controller) {
        if(controller.isSuccessUpload) {
          Get.back();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.close),
              ),
            ),
            Text(
              'Uploading ${data?.length} files',
              style: AppStyle.body2.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) {
                final item = data?[index];
                RxBool isPausedUploadingItem = false.obs;
                return Column(
                  children: [
                    Row(
                      children: [
                        DetermineUploadItem(
                          item: item,
                          itemSize: 64,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      basename('${item?.path}'),
                                      style: AppStyle.subtitle4,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Row(
                                    children: [
                                      Obx(
                                        () => SkyWidgetButton(
                                          borderRadius: 4.5,
                                          color: Colors.grey,
                                          icon: ((index == 0)
                                                  ? (controller
                                                      .isPausedUpload.isTrue)
                                                  : isPausedUploadingItem.isTrue)
                                              ? Icons.play_arrow
                                              : Icons.pause,
                                          onPressed: () {
                                            if(index == 0) {
                                              controller.onPauseResumeUpload();
                                            } else {
                                              isPausedUploadingItem.toggle();
                                              if(isPausedUploadingItem.isTrue) {
                                                controller.timerCtr.stopTimer();
                                              } else {
                                                controller.timerCtr.resumeTimer();
                                              }
                                            }
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
                                          controller
                                              .onDeleteUploadingFile(index);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    FileHelper.getFileSizeString(
                                        bytes: item?.lengthSync() ?? 0),
                                    style: AppStyle.body2.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    ' - ',
                                    style: AppStyle.body2.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${controller.currTimeTimer.value} sec remaining',
                                    style: AppStyle.body2.copyWith(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Obx(
                      () => LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        barRadius: const Radius.circular(30),
                        backgroundColor: AppColors.onPrimary.withOpacity(0.4),
                        progressColor: AppColors.primary,
                        percent: controller.isUploading
                            ? (controller.dummyMaxUploadTime.toDouble() -
                                    double.parse(
                                        controller.currTimeTimer.value)) /
                                controller.dummyMaxUploadTime.value
                            : 0,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            ),
          ],
        );
      },
    );
  }
}
