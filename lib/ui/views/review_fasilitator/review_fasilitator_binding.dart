import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/review_fasilitator/review_fasilitator_controller.dart';

class ReviewFasilitatorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewFasilitatorController());
  }
}