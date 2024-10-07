import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_controller.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/widgets/bootcamp_overview_silabus_card.dart';

class BootcampOverviewSilabus extends GetView<BootcampOverviewController> {
  const BootcampOverviewSilabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          'Apa yang akan kamu pelajari?',
          style: AppStyle.subtitle4.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.args['silabus'].length,
          itemBuilder: (context, index) {
            final item = controller.args['silabus'][index];
            return BootcampOverviewSilabusCard(
              title: item['level'],
              data: item['course'],
            );
          },
        ),
      ],
    );
  }
}
