import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_view.dart';
import 'package:oberi_mobile/ui/views/my_learning_webinar/my_learning_webinar_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class FreeCourseSublist extends StatelessWidget {
  const FreeCourseSublist({Key? key, required this.data}) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Free Course',
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
            return SkyBox(
              padding: const EdgeInsets.all(16),
              elevation: 0,
              onPressed: () {
                if (item['type'] == 'webinar') {
                  Get.toNamed(
                    MyLearningWebinarView.route,
                    arguments: item,
                  );
                } else if (item['type'] == 'bootcamp') {
                  Get.toNamed(
                    MyLearningBootcampView.route,
                    arguments: item,
                  );
                }
              },
              child: Row(
                children: [
                  SkyImage(
                    src: item['banner'],
                    height: 56,
                    width: 56,
                    fit: (item['type'] == 'bootcamp')
                        ? BoxFit.cover
                        : BoxFit.cover,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item['title'],
                      style: AppStyle.body1,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
