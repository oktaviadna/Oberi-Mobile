import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_learning_webinar/my_learning_webinar_controller.dart';

class MyLearningWebinarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLearningWebinarController());
  }
}