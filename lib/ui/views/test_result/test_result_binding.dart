import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_result/test_result_controller.dart';

class TestResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestResultController());
  }
}