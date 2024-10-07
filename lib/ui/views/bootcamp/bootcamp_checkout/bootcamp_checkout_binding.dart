import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_checkout/bootcamp_checkout_controller.dart';

class BootcampCheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BootcampCheckoutController());
  }
}