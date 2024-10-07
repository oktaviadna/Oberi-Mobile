import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/onboarding/onboarding_binding.dart';
import 'package:oberi_mobile/ui/views/onboarding/onboarding_view.dart';

final onboardingRoute = [
  GetPage(
    name: OnboardingView.route,
    page: () => OnboardingView(),
    binding: OnboardingBinding(),
  ),
];
