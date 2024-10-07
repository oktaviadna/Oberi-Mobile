import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/ui/views/test_result/test_result_controller.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_review/test_review_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class TestResultView extends GetView<TestResultController> {
  static const String route = '/test-result';

  const TestResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(
        title: 'Hasil Post Test',
        leading: Container(),
        action: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    TestReviewView.route,
                    arguments: controller.examDataArgs,
                  );
                },
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Review Hasil',
                      textAlign: TextAlign.center,
                      style: AppStyle.subtitle4.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: SkyButton(
                text: 'Lanjut Chapter',
                onPressed: () {
                  Get.close(2);
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Center(
          child: Column(
            children: [
              Text(
                'Yeayy!! \nKamu selesai melakukan pretest',
                textAlign: TextAlign.center,
                style: AppStyle.subtitle2.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 44),
               Stack(
                alignment: Alignment.center,
                children: [
                  const SkyImage(src: 'assets/images/img_test_review.png'),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        // '90',
                        '${(controller.rightAnswer.length / controller.examDataArgs.length * 100).toInt()}',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        '/100',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 79),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SkyBox(
                    elevation: 0,
                    borderRadius: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jawaban salah',
                          style: AppStyle.subtitle3.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SkyImage(
                              src: 'assets/images/ic_close_circle.svg',
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${controller.examDataArgs.length - controller.rightAnswer.length} dari ${controller.examDataArgs.length} soal',
                              style: AppStyle.body1,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SkyBox(
                    elevation: 0,
                    borderRadius: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jawaban benar',
                          style: AppStyle.subtitle3.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SkyImage(
                              src: 'assets/images/ic_checklist_circle.svg',
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${controller.rightAnswer.length} dari ${controller.examDataArgs.length} soal',
                              style: AppStyle.body1,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
