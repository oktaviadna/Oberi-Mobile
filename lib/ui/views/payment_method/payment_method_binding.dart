import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/payment_method/payment_method_controller.dart';

class PaymentMethodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodController());
  }
}