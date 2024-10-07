import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_controller.dart';
import 'package:oberi_mobile/ui/views/my_learning/widgets/my_learning_item_component.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyLearningView extends GetView<MyLearningController> {
  static const String route = '/my-learning';

  const MyLearningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'My Learning'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 12, 20, Get.bottomBarHeight + 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Lanjutkan Belajar',
              style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 1,
              itemBuilder: (context, index) {
                final item = controller.bootcampData.first;
                return MyLearningItemCard(
                  title: item['title'],
                  imageUrl: item['image'],
                  onTap: () {
                    Get.toNamed(MyLearningBootcampView.route, arguments: item);
                  },
                  bottomWidget: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    lineHeight: 7,
                    barRadius: const Radius.circular(4),
                    percent: item['completed_chapter'] / item['chapter_count'],
                    backgroundColor: const Color(0xFFE9E9FA),
                    progressColor: AppColors.primary,
                    trailing: Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          '${item['completed_chapter']} / ${item['chapter_count']}',
                          style: AppStyle.body3,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: kToolbarHeight,
              width: Get.size.width - 40,
              child: TabBar(
                controller: controller.tabController,
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                labelStyle: AppStyle.subtitle3,
                labelPadding: const EdgeInsets.symmetric(horizontal: 24),
                onTap: (index) => controller.update(),
                tabs: const [
                  Tab(text: 'Berlangsung'),
                  Tab(text: 'Selesai'),
                ],
              ),
            ),
            GetBuilder<MyLearningController>(
              builder: (controller) {
                return controller.tabPage[controller.tabController.index] ??
                    Container();
              },
            ),
            GetBuilder<MyLearningController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.tabController.index == 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: SkyButton(
                        text: 'Cari Course',
                        onPressed: () {},
                        wrapContent: true,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
