import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/extensions/int_extension.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class WebinarItemCard extends StatelessWidget {
  const WebinarItemCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.mentor,
    required this.date,
    this.price,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String mentor;
  final int? price;
  final DateTime date;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkyImage(
            src: imageUrl,
            height: 70,
            width: 70,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.subtitle4,
                ),
                const SizedBox(height: 4),
                Text(
                  mentor,
                  style: AppStyle.subtitle4.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd MMM yyyy').format(date),
                      style: AppStyle.body2.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    if (price != null)
                      Text(
                        (price != 0)
                            ? '${price?.currencyFormat(symbol: 'Rp ')}'
                            : 'Gratis',
                        style: AppStyle.body1.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
