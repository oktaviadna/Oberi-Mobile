import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/timer_module.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_controller.dart';

class TestUploadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestUploadController());
    Get.put(TimerModule(), tag: 'upload_time');
  }
}