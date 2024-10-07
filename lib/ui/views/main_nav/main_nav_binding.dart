import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/account/account_binding.dart';
import 'package:oberi_mobile/ui/views/home/home_binding.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_controller.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_binding.dart';
import 'package:oberi_mobile/ui/views/my_points/my_points_binding.dart';

class MainNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavController());
    HomeBinding().dependencies();
    MyLearningBinding().dependencies();
    MyPointsBinding().dependencies();
    AccountBinding().dependencies();
  }
}