import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/asset_management.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/account/account_controller.dart';
import 'package:oberi_mobile/ui/views/account/widgets/menu_item.dart';
import 'package:oberi_mobile/ui/views/faq/faq_view.dart';
import 'package:oberi_mobile/ui/views/history_transaction/history_transaction_view.dart';
import 'package:oberi_mobile/ui/views/my_certificate/my_certificate_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class AccountView extends GetView<AccountController> {
  static const String route = '/account';

  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Account'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: SkyImage(
                src: LocalAsset.profile,
                height: 80,
                width: 80,
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Keira Putri',
              style: AppStyle.subtitle3.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            AccountMenuItem(
              title: 'Profile',
              onTap: () {},
            ),
            AccountMenuItem(
              title: 'My Certificate',
              onTap: () {
                Get.toNamed(MyCertificateView.route);
              },
            ),
            AccountMenuItem(
              title: 'Offline Video',
              onTap: () {},
            ),
            AccountMenuItem(
              title: 'Transaction History',
              onTap: () {
                Get.toNamed(HistoryTransactionTabView.route);
              },
            ),
            AccountMenuItem(
              title: 'FAQ',
              onTap: () {
                Get.toNamed(FaqView.route);
              },
            ),
            AccountMenuItem(
              title: 'Payment Method',
              onTap: () {},
            ),
            AccountMenuItem(
              title: 'Contact Us',
              onTap: () {},
            ),
            const SizedBox(height: 24),
            SkyButton(
              text: 'Log Out',
              wrapContent: true,
              outlineMode: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              onPressed: () {
                controller.onLogout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
