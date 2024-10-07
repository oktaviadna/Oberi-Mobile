import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/validator_helper.dart';
import 'package:oberi_mobile/ui/views/login/login_view.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';

class RegisterController extends GetxController {
  String tag = 'RegisterController : ';

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  RxBool isHiddenPassword = true.obs;

  void hidePassword() => isHiddenPassword.toggle();

  void signUp() {
    if (AppValidator.validateForm(formKey)) {
      Get.offAllNamed(LoginView.route);
    }
  }

  void bypassLogin() async {
    Get.toNamed(MainNavView.route);
  }
}