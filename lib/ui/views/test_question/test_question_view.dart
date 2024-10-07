import 'dart:io';

import 'package:collection_picker/collection_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/timer_helper.dart';
import 'package:oberi_mobile/core/helper/timer_module.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_question/test_question_controller.dart';
import 'package:oberi_mobile/ui/views/test_result/test_result_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class TestQuestionView extends GetView<TestQuestionController> {
  static const String route = '/test-question';

  const TestQuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SkyAppBar.primary(
        iconColor: AppColors.primary,
        title: 'Pertanyaan',
        centerTitle: false,
        elevation: 0,
        action: [
          SkyBox(
            elevation: 0,
            borderColor: AppColors.primary,
            child: Row(
              children: [
                const SkyImage(src: "assets/images/ic_stopwatch.svg"),
                const SizedBox(width: 4),
                GetBuilder<TestQuestionController>(
                  id: 'count_down_timer',
                  builder: (controller) {
                    TimeLeftData timerData = TimerHelper.intToTimeLeftData(
                      controller.timerCtr.currentTime.value,
                    );
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          timerData.minutes,
                          style: AppStyle.subtitle4.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        Text(':',
                            style: AppStyle.subtitle4
                                .copyWith(color: AppColors.primary)),
                        Text(
                          timerData.second,
                          style: AppStyle.subtitle4.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: SafeArea(
        top: (Platform.isIOS) ? true : false,
        bottom: false,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
          ),
          backgroundColor: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Obx(
                  () => GridViewPicker<dynamic>(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisExtent: 56,
                    maxCrossAxisExtent: 62,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    type: PickerType.radio,
                    data: controller.examData,
                    initialValue: controller
                        .examData[controller.selectedQuestion.value - 1],
                    onChanged: (
                      BuildContext context,
                      int index,
                      selectedItem,
                      List<dynamic> selectedListItem,
                    ) {
                      controller.selectedQuestion.value = index + 1;
                      Get.back();
                    },
                    itemBuilder: (context, index, PickerWrapper<dynamic> item) {
                      return SkyBox(
                        elevation: 0,
                        color: Colors.transparent,
                        borderWidth: item.isSelected ? 3.5 : 1,
                        borderRadius: 8,
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: AppStyle.body1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Flexible(
                child: (controller.selectedQuestion.value != 1)
                    ? InkWell(
                        onTap: () {
                          if (controller.selectedQuestion > 0) {
                            controller.selectedQuestion.value -= 1;
                          }
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Sebelumnya',
                            textAlign: TextAlign.center,
                            style: AppStyle.subtitle4.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Obx(
              () => Flexible(
                child: SkyButton(
                  text: (controller.lastQuestion.isTrue)
                      ? 'Selesai'
                      : 'Selanjutnya',
                  onPressed: () {
                    if (controller.lastQuestion.isFalse) {
                      controller.selectedQuestion.value += 1;
                    } else {
                      Get.offNamed(TestResultView.route, arguments: controller.examData);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkyBox(
              elevation: 0,
              color: Colors.grey.shade100,
              borderColor: Colors.transparent,
              padding: const EdgeInsets.all(16),
              child: Obx(
                () => Text(
                  controller.examData[controller.selectedQuestion.value - 1]
                      ['question'],
                  style: AppStyle.body1,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() {
              final dataQuestion =
                  controller.examData[controller.selectedQuestion.value - 1];
              final choices = dataQuestion['choice'];

              return ListViewPicker<Map<String, dynamic>>(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                type: PickerType.radio,
                data: choices,
                onChanged: (context, index, data, datas) {
                  final item = choices[index];
                  dataQuestion['user_answer'] = item;
                },
                itemBuilder: (_, index, data) {
                  final item = choices[index];
                  return SkyBox(
                    elevation: 0,
                    color: (item == dataQuestion['user_answer'])
                        ? AppColors.primary
                        : Colors.grey.shade100,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    borderColor: Colors.transparent,
                    child: Row(
                      children: [
                        SkyBox(
                          elevation: 0,
                          color: Colors.transparent,
                          borderColor: (item == dataQuestion['user_answer'])
                              ? Colors.white
                              : AppColors.primary,
                          borderRadius: 8,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Center(
                            child: Text(
                              item?['code'],
                              style: AppStyle.subtitle4.copyWith(
                                  color: (item == dataQuestion['user_answer'])
                                      ? Colors.white
                                      : AppColors.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item?['description'],
                            style: AppStyle.body2.copyWith(
                                color: (item == dataQuestion['user_answer'])
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
