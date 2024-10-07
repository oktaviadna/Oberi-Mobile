import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/bullet_text.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

class BootcampOverviewSilabusCard extends StatelessWidget {
  const BootcampOverviewSilabusCard({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SkyBox(
      elevation: 0,
      borderColor: AppColors.onPrimary.withOpacity(0.4),
      borderWidth: 2,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.subtitle4.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (_, index) {
              final item = data[index];
              return BulletText(
                padding: EdgeInsets.zero,
                iconPadding: const EdgeInsets.symmetric(vertical: 6),
                verticalSpacing: 0,
                title: Text(
                  item['title'] + ' : ' + item['description'],
                  style: AppStyle.body2.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
