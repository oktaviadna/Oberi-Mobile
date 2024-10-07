import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/login_google_confirm/login_google_confirm_controller.dart';

class LoginGoogleConfirmBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginGoogleConfirmController());
  }
}