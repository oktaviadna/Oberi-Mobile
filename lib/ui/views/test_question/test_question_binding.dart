import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/timer_module.dart';
import 'package:oberi_mobile/ui/views/test_question/test_question_controller.dart';

class TestQuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TimerModule(), tag: 'exam_time');
    Get.lazyPut(() => TestQuestionController());
  }
}