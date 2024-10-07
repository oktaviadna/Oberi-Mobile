import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/payment_success/payment_success_binding.dart';
import 'package:oberi_mobile/ui/views/payment_success/payment_success_view.dart';

final paymentSuccessRoute = [
  GetPage(
    name: PaymentSuccessView.route,
    page: () => const PaymentSuccessView(),
    binding: PaymentSuccessBinding(),
  ),
];
