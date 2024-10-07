import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/redeem_point/redeem_point_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_widget_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class RedeemPointView extends GetView<RedeemPointController> {
  static const String route = '/redeem-point';

  const RedeemPointView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Redeem Point'),
      body: WillPopScope(
        onWillPop: () async {
          Get.back(result: {
            'total_point': controller.totalPoint.value,
            'reward_data': controller.rewardData,
          });
          return true;
        },
        child: GetBuilder<RedeemPointController>(builder: (controller) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: controller.rewardData.length,
            itemBuilder: (context, index) {
              final item = controller.rewardData[index];
              bool hasRedeem = item['status'] == 'Redeemed';
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  SkyBox(
                    height: 104,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    child: Row(
                      children: [
                        SkyImage(
                          src: item['mentor_avatar'],
                          height: 64,
                          width: 64,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.body2.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (item['mentor'] != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  item['mentor'],
                                  style: AppStyle.body2.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                              if (item['date'] != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  DateFormat('dd MMM yyy').format(item['date']),
                                  style: AppStyle.body3.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${item['point']} point',
                              style: AppStyle.body2
                                  .copyWith(color: AppColors.primary),
                            ),
                            const SizedBox(height: 12),
                            SkyWidgetButton(
                              width: hasRedeem ? 110 : 60,
                              color: (controller.totalPoint < item['point'])
                                  ? Colors.grey
                                  : AppColors.primary,
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
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  if (controller.totalPoint < item['point'])
                    Container(
                      height: 104,
                      width: double.infinity,
                      margin: const EdgeInsets.all(4),
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
