import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_binding.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_view.dart';

final bootcampOverviewRoute = [
  GetPage(
    name: BootcampOverviewView.route,
    page: () => const BootcampOverviewView(),
    binding: BootcampOverviewBinding(),
  ),
];
