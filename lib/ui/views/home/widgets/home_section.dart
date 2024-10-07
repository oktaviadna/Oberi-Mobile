import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
    required this.title,
    required this.child,
    this.onTapMore,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTapMore;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              if (onTapMore != null)
                TextButton(
                  onPressed: onTapMore,
                  child: Text(
                    'Lihat Semua',
                    style:
                        AppStyle.subtitle4.copyWith(color: AppColors.primary),
                  ),
                ),
            ],
          ),
        ),
        child,
        const SizedBox(height: 24),
      ],
    );
  }
}
