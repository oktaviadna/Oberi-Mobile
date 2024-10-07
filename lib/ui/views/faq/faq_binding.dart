import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/faq/faq_controller.dart';

class FaqBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}