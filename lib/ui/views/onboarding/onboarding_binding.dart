import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/onboarding/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}