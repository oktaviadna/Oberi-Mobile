import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/dialog_helper.dart';
import 'package:oberi_mobile/core/helper/validator_helper.dart';
import 'package:oberi_mobile/data/dummy_connection.dart';
import 'package:oberi_mobile/data/local/shared_preferences.dart';
import 'package:oberi_mobile/data/local/shared_preferences_key.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  RxBool isHiddenPassword = true.obs;

  void hidePassword() => isHiddenPassword.toggle();

  void login() async {
    if (AppValidator.validateForm(formKey)) {
      if(emailController.text == 'admin@admin.com' && passController.text == 'adminoberi') {
        await DummyConnection.show();
        SPrefs.find.setString(SPrefsKey.token, 'someToken');
        Get.offAllNamed(MainNavView.route);
      } else {
        await DummyConnection.show();
        SkyDialog.failed(message: 'Email atau password salah!');
      }
    }
  }

  void bypassLogin() async {
    Get.toNamed(MainNavView.route);
  }
}
