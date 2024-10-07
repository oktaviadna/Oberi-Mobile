import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/home/home_controller.dart';
import 'package:oberi_mobile/ui/views/home/widgets/home_section.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_view.dart';
import 'package:oberi_mobile/ui/widgets/components/webinar_item_card.dart';

class HomeWebinar extends GetView<HomeController> {
  const HomeWebinar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Oberi Webinar',
      onTapMore: () {},
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: controller.webinarData.length,
        itemBuilder: (context, index) {
          final item = controller.webinarData[index];
          return WebinarItemCard(
            imageUrl: item['image'],
            title: item['title'],
            mentor: item['mentor'],
            date: item['date'],
            price: item['price'],
            onTap: () {
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
          return const Divider();
        },
      ),
    );
  }
}
