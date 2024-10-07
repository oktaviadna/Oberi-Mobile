import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/payment_method/payment_method_binding.dart';
import 'package:oberi_mobile/ui/views/payment_method/payment_method_view.dart';

final paymentMethodRoute = [
  GetPage(
    name: PaymentMethodView.route,
    page: () => const PaymentMethodView(),
    binding: PaymentMethodBinding(),
  ),
];
