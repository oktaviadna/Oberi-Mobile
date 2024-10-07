import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_controller.dart';

class WebinarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebinarController());
  }
}