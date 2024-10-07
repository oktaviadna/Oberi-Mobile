import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_checkout/bootcamp_checkout_binding.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_checkout/bootcamp_checkout_view.dart';

final bootcampCheckoutRoute = [
  GetPage(
    name: BootcampCheckoutView.route,
    page: () => const BootcampCheckoutView(),
    binding: BootcampCheckoutBinding(),
  ),
];
