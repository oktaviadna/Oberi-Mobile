import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/login_google/login_google_controller.dart';

class LoginGoogleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginGoogleController());
  }
}