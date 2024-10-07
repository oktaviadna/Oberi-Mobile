import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/account/account_controller.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}