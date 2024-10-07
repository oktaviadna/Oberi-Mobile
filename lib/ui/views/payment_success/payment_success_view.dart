import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_view.dart';
import 'package:oberi_mobile/ui/views/payment_success/payment_success_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  static const String route = '/payment-success';

  const PaymentSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Hore! Pembayaran kamu berhasil',
                  textAlign: TextAlign.center,
                  style: AppStyle.subtitle1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                const SkyImage(
                  src: 'assets/images/img_payment_success.png',
                  height: 246,
                  width: 246,
                ),
                const SizedBox(height: 44),
                Text(
                  'Pembayaran kamu berhasil diverifikasi. Sekarang kamu bisa mulai untuk belajar',
                  textAlign: TextAlign.center,
                  style: AppStyle.subtitle3.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 64),
                SkyButton(
                  text: 'Mulai Belajar',
                  onPressed: () {
                    Get.offNamedUntil(
                      MyLearningBootcampView.route,
                      arguments: controller.args,
                      ModalRoute.withName(MainNavView.route),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
