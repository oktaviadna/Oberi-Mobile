import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/home/home_controller.dart';
import 'package:oberi_mobile/ui/views/home/widgets/home_section.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class HomeBootcamp extends GetView<HomeController> {
  const HomeBootcamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Oberi Bootcamp',
      child: SkyBox(
        color: AppColors.primary,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Oberi Bootcamp',
                  style: AppStyle.subtitle4.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                'Kelas pelatihan public speaking online yang menggunakan sylabus ter-up to date dengan didampingi mentor yang berpengalaman',
                style: AppStyle.body2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SkyBox(
              color: const Color(0xffE9E9FA),
              elevation: 0,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 5,
                padding: EdgeInsets.zero,
                crossAxisSpacing: 30,
                mainAxisSpacing: 10,
                children: [
                  Row(
                    children: [
                      const SkyImage(src: 'assets/images/ic_check_free.svg'),
                      const SizedBox(width: 4),
                      Text('Free Class', style: AppStyle.body2),
                    ],
                  ),
                  Row(
                    children: [
                      const SkyImage(src: 'assets/images/ic_check_silver.svg'),
                      const SizedBox(width: 4),
                      Text('Silver Class', style: AppStyle.body2),
                    ],
                  ),
                  Row(
                    children: [
                      const SkyImage(src: 'assets/images/ic_check_gold.svg'),
                      const SizedBox(width: 4),
                      Text('Gold Class', style: AppStyle.body2),
                    ],
                  ),
                  Row(
                    children: [
                      const SkyImage(src: 'assets/images/ic_check_platinum.svg'),
                      const SizedBox(width: 4),
                      Expanded(child: Text('Platinum Class', style: AppStyle.body2)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
