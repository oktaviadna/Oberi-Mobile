import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_upload/components/determine_upload_item.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:path/path.dart';

class TestRecentUploadedView extends GetView<TestUploadController> {
  const TestRecentUploadedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<TestUploadController>(
      builder: (controller) {
        return Column(
          children: [
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Upload',
                  style: AppStyle.body2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${controller.uploadedFile.length} item(s)',
                  style: AppStyle.body3.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SkyBox(
              margin: EdgeInsets.zero,
              elevation: 0,
              borderColor: AppColors.onPrimary,
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              child: (controller.uploadedFile.isEmpty)
                  ? Container(
                height: 135,
              )
                  : ListView.separated(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount: controller.uploadedFile.length,
                itemBuilder: (context, index) {
                  final item =
                  controller.uploadedFile[index];
                  return Row(
                    children: [
                      DetermineUploadItem(item: item),
                      Expanded(
                        child: Text(
                          basename(item.path),
                          style: AppStyle.body2.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SkyImage(
                        onTapImage: () {
                          controller
                              .onDeleteUploadedFile(index);
                        },
                        src: 'assets/images/ic_delete.svg',
                      ),
                    ],
                  );
                },
                separatorBuilder:
                    (BuildContext context, int index) {
                  return const SizedBox(height: 12);
                },
              ),
            ),
          ],
        );
      }
    );
  }
}
