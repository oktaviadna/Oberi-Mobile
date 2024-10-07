import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/my_learning_webinar/my_learning_webinar_view.dart';
import 'package:oberi_mobile/ui/widgets/components/webinar_item_card.dart';

class WebinarSublist extends StatelessWidget {
  const WebinarSublist({Key? key, required this.data}) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Webinar',
          style: AppStyle.subtitle3.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return WebinarItemCard(
              imageUrl: item['image'],
              title: item['title'],
              mentor: item['mentor'],
              date: item['date'],
              onTap: () {
                Get.toNamed(
                  MyLearningWebinarView.route,
                  arguments: item,
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ],
    );
  }
}
