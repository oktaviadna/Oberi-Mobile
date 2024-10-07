import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/home/home_controller.dart';
import 'package:oberi_mobile/ui/views/home/widgets/home_section.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class HomeTeamMentor extends GetView<HomeController> {
  const HomeTeamMentor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Team Mentor',
      onTapMore: () {},
      child: SizedBox(
        height: 160,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.mentorData.length,
          itemBuilder: (context, index) {
            final item = controller.mentorData[index];
            return SkyBox(
              width: 120,
              child: Column(
                children: [
                  SkyImage(
                    src: item['image'],
                    height: 64,
                    width: 64,
                    borderRadius: BorderRadius.circular(64),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      item['name'],
                      maxLines: 1,
                      style: AppStyle.body2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 30,
                      child: Center(
                        child: Text(
                          'Cek Profile',
                          style: AppStyle.body2.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 12);
          },
        ),
      ),
    );
  }
}
