import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/bootcamp_detail_controller.dart';

class BootcampDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BootcampDetailController());
  }
}