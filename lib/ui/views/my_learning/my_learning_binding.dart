import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_controller.dart';

class MyLearningBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLearningController());
  }
}