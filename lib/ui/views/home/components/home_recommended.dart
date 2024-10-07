import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/extensions/int_extension.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/home/home_controller.dart';
import 'package:oberi_mobile/ui/views/home/widgets/home_section.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class HomeRecommended extends GetView<HomeController> {
  const HomeRecommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Rekomendasi',
      onTapMore: () {},
      child: SizedBox(
        height: 200,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.recommendedData.length,
          itemBuilder: (context, index) {
            final item = controller.recommendedData[index];
            return SkyBox(
              width: 192,
              height: 200,
              elevation: 0,
              margin: EdgeInsets.zero,
              borderColor: const Color(0xffE9E9FA),
              child: Column(
                children: [
                  SkyImage(
                    src: item['banner'],
                    height: 88,
                    width: 176,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: AppStyle.body2.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '${item['type'].toString().capitalize}: ',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: item['title'])
                      ],
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      (item['price'] as int).currencyFormat(symbol: 'Rp '),
                      style: AppStyle.body2.copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Get.toNamed(
                  WebinarView.route,
                  arguments: {
                    'data': item,
                  },
                );
              },
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
