import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/my_points/my_points_controller.dart';
import 'package:oberi_mobile/ui/views/redeem_point/redeem_point_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_widget_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class MyPointsView extends GetView<MyPointsController> {
  static const String route = '/my-points';

  const MyPointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'My Point'),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: InkWell(
          onTap: () {},
          child: const SkyImage(
            src: 'assets/images/ic_spin_wheels.svg',
            height: 77,
            width: 77,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 16, bottom: Get.bottomBarHeight + 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SkyImage(
                  src: 'assets/images/ic_my_coins.svg',
                ),
                Obx(
                  () => Text(
                    controller.totalPoint.string,
                    style: AppStyle.subtitle0,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            SkyBox(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              elevation: 0,
              width: double.infinity,
              child: Column(
                children: [
                  GetBuilder<MyPointsController>(builder: (controller) {
                    return Wrap(
                      children: List.generate(
                        controller.attandanceData.length,
                        (index) {
                          final item = controller.attandanceData[index];
                          return Column(
                            children: [
                              SkyBox(
                                elevation: 0,
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: 4,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 6,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '+${item['point']}',
                                      style: AppStyle.body2.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    (item['status'] == 'check')
                                        ? const SkyImage(
                                            src: 'assets/images/ic_check.svg')
                                        : const SkyImage(
                                            src: 'assets/images/ic_coin.svg'),
                                  ],
                                ),
                              ),
                              Text(
                                'Hari \nke-${item['hari']}',
                                style: AppStyle.body2.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  Obx(
                    () => SkyWidgetButton(
                      width: 120,
                      height: 30,
                      onPressed: (controller.hasCheck.isTrue)
                          ? null
                          : () => controller.onCheckIn(),
                      child: Center(
                        child: Text(
                          'Check-in hari ini',
                          style: AppStyle.body2.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Mission',
                style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: controller.missionData.length < 3
                  ? controller.missionData.length
                  : 3,
              itemBuilder: (context, index) {
                final item = controller.missionData[index];
                return SkyBox(
                  elevation: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SkyImage(
                            src: item['image'],
                            height: 46,
                            width: 54,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['title'], style: AppStyle.body2),
                                Text(
                                  '+${item['point']} point',
                                  style: AppStyle.body3
                                      .copyWith(color: AppColors.primary),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${item['completed_count']}/${item['total_count']}',
                          style: AppStyle.body3,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Text('Lihat lainnya', style: AppStyle.subtitle4),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Redeem',
                    style: AppStyle.subtitle3
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        RedeemPointView.route,
                        arguments: {
                          'total_point': controller.totalPoint.value,
                          'reward_data': controller.rewardData,
                        },
                      )?.then((value) {
                        if (value != null) {
                          controller.totalPoint.value = value['total_point'];
                          controller.rewardData = value['reward_data'];
                          controller.update();
                        }
                      });
                    },
                    child: Text(
                      'Lihat semua',
                      style: AppStyle.subtitle4
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 210,
              child: GetBuilder<MyPointsController>(builder: (controller) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20, right: 90),
                  itemCount: controller.rewardData.length < 5
                      ? controller.rewardData.length
                      : 5,
                  itemBuilder: (context, index) {
                    final item = controller.rewardData[index];
                    bool hasRedeem = item['status'] == 'Redeemed';
                    return Container(
                      width: 180,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 0),
                              blurRadius: 2,
                              spreadRadius: -1)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: SkyImage(
                              src: item['image'],
                              height: 84,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(item['title'].toString(),
                                style: AppStyle.body2, maxLines: 2),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '${item['point']} Point',
                              style: AppStyle.body2.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SkyWidgetButton(
                                width: hasRedeem ? 110 : 60,
                                onPressed: hasRedeem
                                    ? null
                                    : () => controller.onRedeemReward(item),
                                child: Center(
                                  child: Text(
                                    hasRedeem ? 'Tukar Berhasil' : 'Tukar',
                                    style: AppStyle.body2
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8);
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
