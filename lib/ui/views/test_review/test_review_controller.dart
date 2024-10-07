import 'package:get/get.dart';

class TestReviewController extends GetxController {
  String tag = 'TestReviewController : ';

  List<Map<String, dynamic>> examDataArgs = [];

  @override
  void onInit() {
    examDataArgs = Get.arguments;
    super.onInit();
  }

}