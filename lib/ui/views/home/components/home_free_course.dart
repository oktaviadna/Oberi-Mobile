import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/bootcamp_detail_view.dart';
import 'package:oberi_mobile/ui/views/home/home_controller.dart';
import 'package:oberi_mobile/ui/views/home/widgets/home_section.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class HomeFreeCourse extends GetView<HomeController> {
  const HomeFreeCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Gratis, khusus untuk kamu!',
      onTapMore: () {},
      child: SizedBox(
        height: 168,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.freeForYouData.length,
          itemBuilder: (context, index) {
            final item = controller.freeForYouData[index];
            return InkWell(
              onTap: () {
                if (item['type'] == 'webinar') {
                  Get.toNamed(
                    WebinarView.route,
                    arguments: {
                      'data': item,
                    },
                  );
                } else if (item['type'] == 'bootcamp') {
                  Get.toNamed(
                    BootcampDetailView.route,
                    arguments: {
                      'data': item,
                    },
                  );
                }
              },
              child: SizedBox(
                width: 160,
                child: Column(
                  children: [
                    SkyImage(
                      src: item['banner'],
                      height: 79,
                      width: double.infinity,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        item['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.body2.copyWith(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        (item['type'] == 'webinar')
                            ? DateFormat('dd MMM yyy').format(item['date'])
                            : '${item['chapter_count']} Chapter',
                        style: AppStyle.body2.copyWith(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
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
