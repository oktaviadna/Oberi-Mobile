import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_review/test_review_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';

class TestReviewView extends GetView<TestReviewController> {
  static const String route = '/test-review';

  const TestReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(
        title: 'Review',
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SkyButton(
                outlineMode: true,
                text: 'Lihat Bootcamp',
                onPressed: () {
                  Get.close(3);
                },
              ),
            ),
            Flexible(
              child: SkyButton(
                text: 'Tugas Berikutnya',
                onPressed: () {
                  Get.close(3);
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: controller.examDataArgs.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final item = controller.examDataArgs[index];
          return SkyBox(
            padding: EdgeInsets.zero,
            borderColor: AppColors.onPrimary,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Text(
                    'Pertanyaan ${item['number']}',
                    style: AppStyle.body2.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${item['question']}',
                    style: AppStyle.body1,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  itemCount: (item['choice'] as List).length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final answerItem = item['choice'][index];
                    return _buildAnswer(
                      answer: answerItem['code'],
                      description: answerItem['description'],
                      isTrue: answerItem['is_right'],
                      isWrong: (!answerItem['is_right'])
                          ? answerItem == item['user_answer']
                          : false,
                    );
                  },
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Color(0XFFEAEBFF),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    '“${(item['choice'] as List).firstWhereOrNull((e) => e['is_right'])['description']}”',
                    textAlign: TextAlign.center,
                    style: AppStyle.body2,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }

  Widget _buildAnswer({
    required String answer,
    required String description,
    bool isWrong = false,
    bool isTrue = false,
  }) {
    Color? label;
    if (isTrue) label = AppColors.success;
    if (isWrong) label = AppColors.failed;
    return Container(
      color: label,
      child: Row(
        children: [
          SkyBox(
            elevation: 0,
            color: Colors.transparent,
            borderColor: Colors.white,
            borderRadius: 8,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Center(
              child: Text(
                answer,
                style: AppStyle.subtitle4.copyWith(
                  color: (isTrue || isWrong) ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              description,
              style: AppStyle.body2.copyWith(
                fontWeight:
                    (isTrue || isWrong) ? FontWeight.w500 : FontWeight.w400,
                color: (isTrue || isWrong) ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isTrue) const Icon(Icons.check, color: Colors.white),
          if (isWrong) const Icon(Icons.close, color: Colors.white),
          if (isTrue || isWrong) const SizedBox(width: 8),
        ],
      ),
    );
  }
}
