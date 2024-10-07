import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_controller.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/widgets/bootcamp_overview_benefit_card.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

class BootcampOverviewDesc extends GetView<BootcampOverviewController> {
  const BootcampOverviewDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          'Apa yang kamu dapatkan?',
          style: AppStyle.subtitle4.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.args['benefit'].length,
          itemBuilder: (context, index) {
            final item = controller.args['benefit'][index];
            return BootcampOverviewBenefitCard(
              title: item['title'],
              description: item['description'],
            );
          },
        ),
        const SizedBox(height: 8),
        SkyBox(
          elevation: 0,
          borderColor: AppColors.onPrimary.withOpacity(0.4),
          borderWidth: 2,
          padding: const EdgeInsets.all(8),
          width: Get.width,
          child: Column(
            children: [
              Text(
                'Mekanisme Kelas',
                style: AppStyle.subtitle4.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Kelas akan dibawakan oleh mentor kami. Kamu bisa berkonsultasi '
                'dengan mentor mengenai materi/quiz/tugas yang dipelajari',
                style: AppStyle.body2.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        // BootcampOverviewCard(
        //   title: 'Belajar Bersama Mentor Berpengalaman',
        //   description:
        //       'Belajar secara live bareng mentor berpengalaman di bidangnya',
        // ),
      ],
    );
  }
}
