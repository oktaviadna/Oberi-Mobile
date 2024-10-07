import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/extensions/int_extension.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_checkout/bootcamp_checkout_view.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_controller.dart';
import 'package:oberi_mobile/ui/widgets/base/base_bottom_bar.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';

class BootcampOverviewView extends GetView<BootcampOverviewController> {
  static const String route = '/bootcamp-overview';

  const BootcampOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Oberi Bootcamp'),
      bottomNavigationBar: BaseBottomBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (controller.args['price'] as int).currencyFormat(symbol: 'Rp '),
              style: AppStyle.subtitle4.copyWith(
                  color: AppColors.primary, fontWeight: FontWeight.w700),
            ),
            SkyButton(
              text: 'Bayar',
              padding: const EdgeInsets.symmetric(horizontal: 24),
              wrapContent: true,
              onPressed: () {
                Get.toNamed(
                  BootcampCheckoutView.route,
                  arguments: controller.args,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Text(
              controller.args['title'],
              style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              controller.args['detail'],
              style: AppStyle.subtitle4.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
            TabBar(
              controller: controller.tabController,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.grey,
              labelStyle: AppStyle.subtitle3,
              labelPadding: const EdgeInsets.symmetric(horizontal: 24),
              onTap: (index) => controller.update(),
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Silabus'),
                Tab(text: 'Biaya'),
              ],
            ),
            GetBuilder<BootcampOverviewController>(
              builder: (controller) {
                return controller.tabPage[controller.tabController.index] ??
                    Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
