import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}