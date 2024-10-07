import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/label_widget.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

enum BootcampSectionStatus {
  lock,
  unlock,
}

enum BootcampSectionTier {
  free,
  silver,
  gold,
  platinum,
}

class BootcampSection extends StatelessWidget {
  const BootcampSection({
    Key? key,
    required this.text,
    required this.status,
    this.childExpand,
    this.labelWidget,
    this.overlayColor,
    this.onTap,
  }) : super(key: key);

  final Widget? childExpand;
  final BootcampSectionStatus status;
  final Widget? labelWidget;
  final String text;
  final Color? overlayColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    RxBool isSelect = false.obs;

    return Obx(
      () => SkyBox(
        onPressed: onTap ??
            () {
              isSelect.toggle();
            },
        elevation: 0,
        borderColor: (overlayColor != null) ? AppColors.failed :
            (isSelect.isTrue) ? AppColors.primary : AppColors.onPrimary,
        borderRadius: 8,
        borderWidth: 2,
        color:  (overlayColor != null) ? Colors.red.withOpacity(0.1) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.subtitle3
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      if (labelWidget != null) ...[
                        const SizedBox(height: 8),
                        labelWidget!
                      ],
                    ],
                  ),
                ),
                (status == BootcampSectionStatus.unlock)
                    ? (isSelect.isTrue)
                        ? const Icon(Icons.keyboard_arrow_up)
                        : const Icon(Icons.keyboard_arrow_down)
                    : const LabelWidget(
                        text: 'Premium',
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
              ],
            ),
            if (isSelect.isTrue && status == BootcampSectionStatus.unlock)
              if (childExpand != null) ...[
                const SizedBox(height: 32),
                childExpand!,
              ]
          ],
        ),
      ),
    );
  }
}
