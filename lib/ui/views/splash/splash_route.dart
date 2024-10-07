import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/splash/splash_binding.dart';
import 'package:oberi_mobile/ui/views/splash/splash_view.dart';

final splashRoute = [
  GetPage(
    name: SplashView.route,
    page: () => const SplashView(),
    binding: SplashBinding()
  ),
];
