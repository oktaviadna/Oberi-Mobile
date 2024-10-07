import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/file_helper.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_controller.dart';
import 'package:path/path.dart';

import 'determine_upload_item.dart';

class TestSuccessUploadingView extends GetView<TestUploadController> {
  const TestSuccessUploadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestUploadController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'File',
              style: AppStyle.body2.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.pickedFile?.length ?? 0,
              itemBuilder: (context, index) {
                final item = controller.pickedFile?[index];
                return Row(
                  children: [
                    DetermineUploadItem(item: item, itemSize: 64),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            basename('${item?.path}'),
                            style: AppStyle.subtitle4,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            FileHelper.getFileSizeString(
                                bytes: item?.lengthSync() ?? 0),
                            style: AppStyle.body2.copyWith(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 4);
              },
            )
          ],
        );
      }
    );
  }
}
