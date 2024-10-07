import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/home/home_binding.dart';
import 'package:oberi_mobile/ui/views/home/home_view.dart';

final homeRoute = [
  GetPage(
    name: HomeView.route,
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
];
