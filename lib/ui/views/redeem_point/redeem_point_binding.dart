import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/redeem_point/redeem_point_controller.dart';

class RedeemPointBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RedeemPointController());
  }
}