import 'package:get/get.dart';

class TestResultController extends GetxController {
  String tag = 'TestResultController : ';

  List<Map<String, dynamic>> examDataArgs = [];

  List<Map<String, dynamic>?> rightAnswer = [];

  @override
  void onInit() {
    examDataArgs = Get.arguments;
    calculateTrueAnswer();
    super.onInit();
  }

  void calculateTrueAnswer() {
    for(var i in examDataArgs) {
      if(i['user_answer']['is_right']) {
        rightAnswer.add(i);
      }
    }
  }
}