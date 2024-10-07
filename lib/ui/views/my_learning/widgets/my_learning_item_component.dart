import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class MyLearningItemCard extends StatelessWidget {
  const MyLearningItemCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.bottomWidget,
    this.onTap,
  }) : super(key: key);

  final Widget bottomWidget;
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SkyBox(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
      onPressed: onTap,
      child: Row(
        children: [
          SkyImage(
            src: imageUrl,
            height: 66,
            width: 66,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyle.body2,
                ),
                const SizedBox(height: 8),
                bottomWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
