import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oberi_mobile/ui/views/intro/intro_view.dart';

class OnboardingController extends GetxController {
  String tag = 'OnboardingController : ';

  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  bool get isFirstPage => currentIndex.value == 0;

  bool get isLastPage => currentIndex.value == 2;

  void onNextPage() {
    if (!isLastPage) {
      pageController.nextPage(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 260),
      );
    } else {
      Get.find<GetStorage>().write('first_install', false);
      Get.offNamed(IntroView.route);
    }
  }
}
