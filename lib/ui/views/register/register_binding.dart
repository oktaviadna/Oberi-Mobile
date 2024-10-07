import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}