import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/dialog_helper.dart';
import 'package:oberi_mobile/core/helper/validator_helper.dart';
import 'package:oberi_mobile/data/dummy_connection.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';
import 'package:oberi_mobile/ui/views/payment_method/payment_method_view.dart';
import 'package:oberi_mobile/ui/views/payment_success/payment_success_view.dart';

class BootcampCheckoutController extends GetxController {
  String tag = 'BootcampCheckoutController : ';

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final acceptSK = false.obs;
  Map<String, dynamic>? paymentMethod;

  late Map<String, dynamic> args;

  @override
  void onInit() {
    args = Get.arguments;
    setProfileData();
    super.onInit();
  }

  void setProfileData() {
    nameController.text = 'Keira Putri';
    phoneController.text = '085212345678';
    emailController.text = 'keira.putri@mail.com';
  }

  void onCheckout() async {
    if (AppValidator.validateForm(formKey)) {
      if (paymentMethod == null) {
        SkyDialog.failed(message: 'Pilih metode pembayaran terlebih dahulu');
      } else if (acceptSK.isFalse) {
        SkyDialog.failed(message: 'Kamu belum menyetujui syarat dan ketentuan');
      } else {
        await DummyConnection.show();
        Get.offNamedUntil(
          PaymentSuccessView.route,
          arguments: args,
          ModalRoute.withName(MainNavView.route),
        );
      }
    }
  }

  void selectPaymentMethod() {
    Get.toNamed(PaymentMethodView.route)?.then(
      (value) {
        paymentMethod = value;
        update();
      },
    );
  }
}
