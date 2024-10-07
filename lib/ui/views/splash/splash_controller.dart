import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oberi_mobile/data/local/shared_preferences.dart';
import 'package:oberi_mobile/data/local/shared_preferences_key.dart';
import 'package:oberi_mobile/ui/views/intro/intro_view.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';
import 'package:oberi_mobile/ui/views/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  String tag = 'RegisterController : ';

  SharedPreferences prefs = SPrefs.find;

  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () async {
        final bool isFirstInstall =
            Get.find<GetStorage>().read('first_install') ?? true;
        // bool isFirstInstall = prefs.getBool(SPrefsKey.isFirstInstall) ?? true;
        if (isFirstInstall) {
          // SPrefs.find.setBool(SPrefsKey.isFirstInstall, false);
          // Get.find<GetStorage>().write('first_install', false);
          Get.offAllNamed(OnboardingView.route);
        } else {
          redirectToApps();
        }
      },
    );
    super.onInit();
  }

  bool get isLoggedIn =>
      prefs.getString(SPrefsKey.token) != '' &&
      prefs.getString(SPrefsKey.token) != null;

  void redirectToApps() {
    if (isLoggedIn) {
      Get.offAllNamed(MainNavView.route);
    } else {
      Get.offAllNamed(IntroView.route);
    }
  }
}
