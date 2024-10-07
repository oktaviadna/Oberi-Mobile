import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/bootcamp_detail_controller.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class BootcampBuyDialog extends GetView<BootcampDetailController> {
  const BootcampBuyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => Get.back(),
              child: const Icon(Icons.close),
            ),
          ),
          const SkyImage(
            src: 'assets/images/img_buy_bootcamp.svg',
          ),
          Text(
            'Oops, kamu belum beli OBERI Bootcamp!',
            textAlign: TextAlign.center,
            style: AppStyle.subtitle3.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Beli akses OBERI Bootcamp untuk menikmati konsultasi bersama fasilitator!',
            textAlign: TextAlign.center,
            style: AppStyle.body2.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lihat Mentor',
                style: AppStyle.subtitle4.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
              SkyButton(
                text: 'Beli Akses',
                wrapContent: true,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPressed: () {
                  Get.back();
                  Get.toNamed(
                    BootcampOverviewView.route,
                    arguments: controller.args,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
