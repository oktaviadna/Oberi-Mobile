import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_upload/components/test_recent_uploaded_view.dart';
import 'package:oberi_mobile/ui/views/test_upload/components/test_success_uploading_view.dart';
import 'package:oberi_mobile/ui/views/test_upload/components/test_uploading_view.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_controller.dart';
import 'package:oberi_mobile/ui/widgets/keyboard_dismisser.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_form_field.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class TestUploadView extends GetView<TestUploadController> {
  static const String route = '/test-upload';

  const TestUploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Upload Post Test'),
      body: GetBuilder<TestUploadController>(
        builder: (controller) {
          return KeyboardDismisser(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.onPickVideo();
                      },
                      child: DottedBorder(
                        dashPattern: const [5],
                        radius: const Radius.circular(8),
                        borderType: BorderType.RRect,
                        color: AppColors.primary,
                        padding: EdgeInsets.zero,
                        strokeWidth: 4,
                        child: Container(
                          height: 135,
                          width: Get.width,
                          color: const Color(0XFFC7C7F2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SkyImage(
                                src: 'assets/images/ic_upload.svg',
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Max. File size: 10 MB',
                                style: AppStyle.body2.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Max. File size: 10 MB',
                                style: AppStyle.body3.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => Visibility(
                        visible: controller.pickedFile != null &&
                            controller.pickedFile!.isNotEmpty,
                        child: SkyBox(
                          elevation: 0,
                          borderColor: AppColors.onPrimary,
                          borderRadius: 8,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: (controller.isUploading)
                              ? const TestUploadingView()
                              : const TestSuccessUploadingView(),
                          // child: Container(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tambahkan Komentar',
                      style: AppStyle.subtitle4.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SkyFormField(
                      hint: 'Tambahkan komentarmu',
                      controller: controller.commentController,
                      style: const TextStyle(fontSize: 12),
                      // validator: (value) =>
                      //     AppValidator.generalField(value.toString()),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SkyButton(
                        text: 'Kirim',
                        wrapContent: true,
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        onPressed: (controller.pickedFile == null ||
                                controller.isUploading ||
                                controller.pickedFile!.isEmpty)
                            ? null
                            : () {
                                controller.onSubmit();
                              },
                      ),
                    ),
                    if (controller.pickedFile != null)
                      const TestRecentUploadedView(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
