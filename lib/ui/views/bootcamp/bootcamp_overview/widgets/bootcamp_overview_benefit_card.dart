import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

class BootcampOverviewBenefitCard extends StatelessWidget {
  const BootcampOverviewBenefitCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SkyBox(
      elevation: 0,
      borderColor: AppColors.onPrimary.withOpacity(0.4),
      borderWidth: 2,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: Colors.blue,
            size: 32,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 46.0),
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
                  Text(
                    description,
                    style: AppStyle.body2.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
