import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_points/my_points_controller.dart';

class MyPointsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPointsController());
  }
}