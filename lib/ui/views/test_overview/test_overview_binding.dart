import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_overview/test_overview_controller.dart';

class TestOverviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestOverviewController());
  }
}