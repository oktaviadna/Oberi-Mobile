import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_binding.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_view.dart';

final webinarRoute = [
  GetPage(
    name: WebinarView.route,
    page: () => const WebinarView(),
    binding: WebinarBinding(),
  ),
];
