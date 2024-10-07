import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/my_learning/widgets/my_learning_item_component.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_view.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BootcampSublist extends StatelessWidget {
  const BootcampSublist({Key? key, required this.data}) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bootcamp',
          style: AppStyle.subtitle3.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return MyLearningItemCard(
              title: item['title'],
              imageUrl: item['image'],
              onTap: () {
                Get.toNamed(MyLearningBootcampView.route, arguments: item);
              },
              bottomWidget: LinearPercentIndicator(
                padding: EdgeInsets.zero,
                lineHeight: 7,
                barRadius: const Radius.circular(4),
                percent: item['completed_chapter'] / item['chapter_count'],
                backgroundColor: const Color(0xFFE9E9FA),
                progressColor: AppColors.primary,
                trailing: Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      '${item['completed_chapter']} / ${item['chapter_count']}',
                      style: AppStyle.body3,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
