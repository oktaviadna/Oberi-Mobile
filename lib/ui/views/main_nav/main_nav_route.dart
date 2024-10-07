import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_binding.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';

final mainNavRoute = [
  GetPage(
    name: MainNavView.route,
    page: () => const MainNavView(),
    binding: MainNavBinding(),
  ),
];
