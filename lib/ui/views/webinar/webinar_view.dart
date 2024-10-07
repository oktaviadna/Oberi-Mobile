import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/extensions/int_extension.dart';
import 'package:oberi_mobile/core/helper/sky_snackbar.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_controller.dart';
import 'package:oberi_mobile/ui/widgets/base/base_bottom_bar.dart';
import 'package:oberi_mobile/ui/widgets/components/webinar_item_card.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class WebinarView extends GetView<WebinarController> {
  static const String route = '/webinar';

  const WebinarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Webinar'),
      bottomNavigationBar: BaseBottomBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (controller.webinarArgs['price'] as int)
                  .currencyFormat(symbol: 'Rp '),
              style: AppStyle.subtitle4.copyWith(
                  color: AppColors.primary, fontWeight: FontWeight.w700),
            ),
            SkyButton(
              text: 'Daftar Event',
              wrapContent: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkyImage(
              src: controller.webinarArgs['banner'],
              width: double.infinity,
              height: 172,
              borderRadius: BorderRadius.circular(4),
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 12),
            Text(
              controller.webinarArgs['title'],
              style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SkyImage(src: 'assets/images/ic_location.svg'),
                const SizedBox(width: 8),
                Text(
                  (controller.webinarArgs['location'] as String)
                      .capitalize
                      .toString(),
                  style: AppStyle.body2,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SkyImage(src: 'assets/images/ic_calender.svg'),
                const SizedBox(width: 8),
                Text(
                  DateFormat('dd MMM yyy')
                      .format(controller.webinarArgs['date']),
                  style: AppStyle.body2,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SkyImage(src: 'assets/images/ic_clock.svg'),
                const SizedBox(width: 8),
                Text(
                  '${DateFormat('HH.mm').format(controller.webinarArgs['date'])} - ${DateFormat('HH.mm').format(
                    (controller.webinarArgs['date'] as DateTime).add(
                      Duration(minutes: controller.webinarArgs['duration']),
                    ),
                  )} WIB',
                  style: AppStyle.body2,
                ),
              ],
            ),
            const SizedBox(height: 32),
            SkyButton(
              text: 'Dapatkan Link Zoom',
              onPressed: () {
                SkySnackBar.error(
                    message: 'Anda harus mendaftar terlebih dahulu.');
              },
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.grey),
            const SizedBox(height: 24),
            Text('Detail Acara', style: AppStyle.subtitle4),
            const SizedBox(height: 8),
            Obx(
              () => Text(
                controller.webinarArgs['detail'],
                style: AppStyle.subtitle4.copyWith(fontWeight: FontWeight.w400),
                maxLines: (controller.showDetail.isTrue) ? null : 4,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                controller.showDetail.toggle();
              },
              child: Obx(
                () => Text(
                  controller.showDetail.isTrue
                      ? 'Sembunyikan'
                      : 'Lihat selengkapnya',
                  style: AppStyle.body2.copyWith(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.grey),
            const SizedBox(height: 24),
            Text('Speaker', style: AppStyle.subtitle4),
            const SizedBox(height: 16),
            Row(
              children: [
                SkyImage(
                  src: controller.webinarArgs['image'],
                  height: 72,
                  width: 72,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.webinarArgs['mentor'],
                      style: AppStyle.subtitle4
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lihat Profile',
                      style:
                          AppStyle.body2.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.grey),
            const SizedBox(height: 24),
            Text('Lihat Event Lainnya', style: AppStyle.subtitle4),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.otherWebinarData.length,
              itemBuilder: (context, index) {
                final item = controller.otherWebinarData[index];
                return WebinarItemCard(
                  imageUrl: item['image'],
                  title: item['title'],
                  mentor: item['mentor'],
                  date: item['date'],
                  price: item['price'],
                  onTap: () {
                    Get.toNamed(WebinarView.route, arguments: item);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}
