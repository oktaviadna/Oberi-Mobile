import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_controller.dart';

class BootcampOverviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BootcampOverviewController());
  }
}