import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/widgets/bootcamp_section.dart';
import 'package:oberi_mobile/ui/views/chat/chat_view.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/bootcamp_material_list.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_controller.dart';
import 'package:oberi_mobile/ui/views/review_fasilitator/review_fasilitator_view.dart';
import 'package:oberi_mobile/ui/views/test_overview/test_overview_view.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_view.dart';
import 'package:oberi_mobile/ui/widgets/label_widget.dart';
import 'package:oberi_mobile/ui/widgets/notif_banner.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyLearningBootcampView extends GetView<MyLearningBootcampController> {
  static const String route = '/my-learning-bootcamp';

  const MyLearningBootcampView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Detail Bootcamp'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => NotificationBanner(
                isShow: controller.isNotCompletedCourse.isTrue,
                text:
                    'Maaf, kamu belum lulus ke chapter berikutnya. Silahkan lakukan remedial atau berkonsultasi dengan mentor.',
                color: AppColors.failed,
                height: 87,
                onTap: () {
                  controller.isNotCompletedCourse.value = false;
                },
              ),
            ),
            Obx(
              () => NotificationBanner(
                isShow: controller.isUploadStatus.isTrue,
                text: 'Jangan lupa upload Challenge kamu ya!',
                color: AppColors.info,
                onTap: () {
                  controller.isUploadStatus.value = false;
                },
              ),
            ),
            const SizedBox(height: 16),
            SkyImage(
              src: controller.bootcampArgs['banner'],
              width: double.infinity,
              height: 172,
              borderRadius: BorderRadius.circular(9),
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Progress Belajar',
                  style:
                      AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  '${controller.bootcampArgs['completed_chapter']} / ${controller.bootcampArgs['chapter_count']}',
                  style: AppStyle.subtitle3.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SkyBox(
              elevation: 0,
              borderRadius: 8,
              borderWidth: 1,
              borderColor: AppColors.onPrimary,
              color: const Color(0xffc7c7f2).withOpacity(0.2),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        textAlign: TextAlign.center,
                        style: AppStyle.body2
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const LabelWidget(
                        color: Color(0xffcacaca),
                        text: 'Silver',
                        textColor: Colors.black,
                        trailing: SkyImage(
                          src: 'assets/images/ic_check_silver.svg',
                          color: Colors.black,
                          height: 18,
                        ),
                      ),
                      const LabelWidget(
                        color: AppColors.gold,
                        text: 'Gold',
                        textColor: Colors.white,
                        trailing: SkyImage(
                          src: 'assets/images/ic_check_gold.svg',
                          height: 18,
                          color: Colors.white,
                        ),
                      ),
                      const LabelWidget(
                        color: AppColors.platinum,
                        text: 'Platinum',
                        textColor: Colors.white,
                        trailing: SkyImage(
                          src: 'assets/images/ic_check_platinum.svg',
                          color: Colors.white,
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    lineHeight: 19,
                    percent: controller.bootcampArgs['completed_chapter'] /
                        controller.bootcampArgs['chapter_count'],
                    backgroundColor: Colors.grey.withOpacity(0.8),
                    progressColor: AppColors.primary,
                    // widgetIndicator: Text('70'),
                    center: Text(
                      "${controller.bootcampArgs['completed_chapter'] / controller.bootcampArgs['chapter_count'] * 100}%",
                      style: AppStyle.body2.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    barRadius: const Radius.circular(20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Deskripsi',
              style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(controller.bootcampArgs['detail'], style: AppStyle.body2),
            const SizedBox(height: 18),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 5 / 1,
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              children: [
                Row(
                  children: [
                    const SkyImage(src: 'assets/images/ic_calendar.svg'),
                    const SizedBox(width: 10),
                    Text('Senin - Jumat', style: AppStyle.body2),
                  ],
                ),
                Row(
                  children: [
                    const SkyImage(src: 'assets/images/ic_psp.svg'),
                    const SizedBox(width: 10),
                    Text('PSP-22', style: AppStyle.body2),
                  ],
                ),
                Row(
                  children: [
                    const SkyImage(src: 'assets/images/ic_clock.svg'),
                    const SizedBox(width: 10),
                    Text('19.00 - 20.00 WIB', style: AppStyle.body2),
                  ],
                ),
                Row(
                  children: [
                    const SkyImage(src: 'assets/images/ic_mentor.svg'),
                    const SizedBox(width: 10),
                    Text(controller.bootcampArgs['mentor'], style: AppStyle.body2),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SkyButton(
                    text: 'Chat Mentor',
                    outlineMode: true,
                    onPressed: () {
                      Get.toNamed(ChatView.route, arguments: controller.bootcampArgs);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: SkyButton(
                    text: 'Gabung Zoom',
                    onPressed: () {
                      controller.onJoinZoom();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.unlock,
              text: 'Free Course',
              childExpand: BootcampMaterialList(
                data: controller.freeCourseData,
                onTap: (data) {},
              ),
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.unlock,
              overlayColor: (controller.bootcampArgs['silabus'] as List)
                          .where((e) => e['level'] == 'Silver')
                          .firstOrNull['status'] ==
                      'remedial'
                  ? AppColors.failed
                  : null,
              text: controller.bootcampArgs['title'],
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
              childExpand: BootcampMaterialList(
                data: controller.silverCourseData,
                onTap: (data) {
                  if (data['status'] == 'pretest' ||
                      data['status'] == 'posttest') {
                    final tierData = (controller.bootcampArgs['silabus'] as List)
                        .firstWhereOrNull((e) => e['status'] == 'progress');
                    final chapterProgress = (tierData['course'] as List)
                        .firstWhereOrNull((e) => e['status'] == 'progress');
                    Get.toNamed(
                      TestOverviewView.route,
                      arguments: chapterProgress,
                    );
                  }

                  if (data['status'] == 'remedial') {
                    Get.toNamed(
                      ReviewFasilitatorView.route,
                      arguments: controller.bootcampArgs,
                    );
                  }

                  if (data['status'] == 'upload_task') {
                    Get.toNamed(
                      TestUploadView.route,
                      arguments: controller.bootcampArgs,
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.unlock,
              text: controller.bootcampArgs['title'],
              overlayColor: (controller.bootcampArgs['silabus'] as List)
                          .where((e) => e['level'] == 'Gold')
                          .firstOrNull['status'] ==
                      'remedial'
                  ? AppColors.failed
                  : null,
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
              childExpand: BootcampMaterialList(
                data: controller.goldCourseData,
                onTap: (data) {},
              ),
            ),
            const SizedBox(height: 16),
            BootcampSection(
              status: BootcampSectionStatus.unlock,
              text: controller.bootcampArgs['title'],
              overlayColor: (controller.bootcampArgs['silabus'] as List)
                          .where((e) => e['level'] == 'Platinum')
                          .firstOrNull['status'] ==
                      'remedial'
                  ? AppColors.failed
                  : null,
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
              childExpand: BootcampMaterialList(
                data: controller.platinumCourseData,
                onTap: (data) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
