import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/chat/chat_view.dart';
import 'package:oberi_mobile/ui/views/review_fasilitator/review_fasilitator_controller.dart';
import 'package:oberi_mobile/ui/widgets/base/base_bottom_bar.dart';
import 'package:oberi_mobile/ui/widgets/notif_banner.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class ReviewFasilitatorView extends GetView<ReviewFasilitatorController> {
  static const String route = '/review-fasilitator';

  const ReviewFasilitatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Review Fasilitator'),
      bottomNavigationBar: BaseBottomBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SkyButton(
                text: 'Chat Mentor',
                outlineMode: true,
                onPressed: () {
                  Get.toNamed(ChatView.route, arguments: controller.bootcampArgs);
                },
              ),
            ),
            Flexible(
              child: SkyButton(
                text: 'Lihat Remedial',
                color: AppColors.failed,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
                  () =>
                  NotificationBanner(
                    isShow: controller.isShowBanner.isTrue,
                    text:
                    'Maaf, kamu belum lulus ke chapter berikutnya. Silahkan lakukan remedial.',
                    color: AppColors.failed,
                    height: 66,
                    onTap: () {
                      controller.isShowBanner.value = false;
                    },
                  ),
            ),
            const SizedBox(height: 16),
            SkyBox(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SkyImage(
                        src: controller.bootcampArgs['image'],
                        height: 60,
                        width: 60,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.bootcampArgs['mentor'],
                            style: AppStyle.subtitle4.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            DateFormat('dd MMM yy').format(
                              DateTime.now(),
                            ),
                            style: AppStyle.body3
                                .copyWith(fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Halo, Keira. Berikut Feedbackku terkait post test kamu di chapter 8:',
                    style: AppStyle.body2,
                  ),
                  Text(
                    '1. Pembawaan',
                    style: AppStyle.body2.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Untuk pembawaan kamu masih terlihat gugup, kamu masih berfokus pada tekstual, belum dapat berimprovisasi. ',
                    style: AppStyle.body2,
                  ),
                  Text(
                    '2. Kedewasaan',
                    style: AppStyle.body2.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Kamu menyampaikan materi dengan terbata-bata. Tenang aja, kamu masih dapat lanjut ke chapter berikutnya dengan mengerjakan remedial terlebih dahulu ya.',
                    style: AppStyle.body2,
                  ),
                  Text(
                    'Halo, Keira. Berikut Feedbackku terkait post test kamu di chapter 8:',
                    style: AppStyle.body2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Score Kamu',
              style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Obx(
                  () =>
                  SkyBox(
                    elevation: 0,
                    onPressed: () {
                      controller.isShowDetailRating.toggle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(
                              horizontal: 4.0),
                          unratedColor: Colors.grey.withOpacity(0.1),
                          tapOnlyMode: false,
                          itemBuilder: (context, _) =>
                          const SkyImage(
                            src: 'assets/images/ic_star.svg',
                          ),
                          onRatingUpdate: (rating) {
                            debugPrint(rating.toString());
                          },
                        ),
                        (controller.isShowDetailRating.isTrue)
                            ? const Icon(Icons.keyboard_arrow_down)
                            : const Icon(Icons.keyboard_arrow_up),
                      ],
                    ),
                  ),
            ),
            Obx(
                  () =>
                  Visibility(
                    visible: controller.isShowDetailRating.isTrue,
                    child: SkyBox(
                      elevation: 0,
                      color: Colors.grey.shade200,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kemampuan improvisasi',
                            style: AppStyle.subtitle4,
                          ),
                          Text(
                            '2/5',
                            style: AppStyle.subtitle4,
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
            Obx(
                  () =>
                  Visibility(
                    visible: controller.isShowDetailRating.isTrue,
                    child: SkyBox(
                      elevation: 0,
                      color: Colors.grey.shade200,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Penguasaan materi',
                            style: AppStyle.subtitle4,
                          ),
                          Text(
                            '3/5',
                            style: AppStyle.subtitle4,
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
