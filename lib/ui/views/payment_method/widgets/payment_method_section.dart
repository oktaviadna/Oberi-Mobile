import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({
    Key? key,
    required this.text,
    this.childExpand,
    this.labelWidget,
    this.onTap,
    this.showDetail = false,
  }) : super(key: key);

  final Widget? childExpand;
  final Widget? labelWidget;
  final String text;
  final VoidCallback? onTap;
  final bool showDetail;

  @override
  Widget build(BuildContext context) {
    RxBool isSelect = false.obs;
    isSelect.value = showDetail;
    // print('Is select = ${isSelect.value}');
    return Obx(
      () => SkyBox(
        onPressed: onTap ??
            () {
              isSelect.toggle();
            },
        elevation: 0,
        borderRadius: 8,
        borderWidth: 2,
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
                (isSelect.isTrue)
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.keyboard_arrow_down),
              ],
            ),
            if (isSelect.isTrue)
              if (childExpand != null) ...[
                const SizedBox(height: 24),
                childExpand!,
              ]
          ],
        ),
      ),
    );
  }
}
