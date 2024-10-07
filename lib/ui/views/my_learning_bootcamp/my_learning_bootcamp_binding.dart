import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_controller.dart';

class MyLearningBootcampBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLearningBootcampController());
  }
}