import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/bootcamp_detail_binding.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/bootcamp_detail_view.dart';

final bootcampDetailRoute = [
  GetPage(
    name: BootcampDetailView.route,
    page: () => const BootcampDetailView(),
    binding: BootcampDetailBinding(),
  ),
];
