import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/payment_success/payment_success_controller.dart';

class PaymentSuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentSuccessController());
  }
}