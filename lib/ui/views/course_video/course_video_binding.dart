import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/course_video/course_video_controller.dart';

class CourseVideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseVideoController());
  }
}