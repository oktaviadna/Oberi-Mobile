import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_overview/test_overview_binding.dart';
import 'package:oberi_mobile/ui/views/test_overview/test_overview_view.dart';

final testOverviewRoute = [
  GetPage(
    name: TestOverviewView.route,
    page: () => const TestOverviewView(),
    binding: TestOverviewBinding(),
  ),
];
