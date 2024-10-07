import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_certificate/my_certificate_controller.dart';

class MyCertificateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCertificateController());
  }
}