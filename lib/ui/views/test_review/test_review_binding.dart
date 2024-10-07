import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_review/test_review_controller.dart';

class TestReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestReviewController());
  }
}