import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/timer_helper.dart';
import 'package:oberi_mobile/core/helper/timer_module.dart';
import 'package:oberi_mobile/data/dummy/exam/exam_data.dart';

class TestQuestionController extends GetxController {
  String tag = 'TestQuestionController : ';

  List<Map<String, dynamic>> examData = examDummyData;
  RxInt selectedQuestion = 1.obs;

  final timerCtr = Get.find<TimerModule>(tag: 'exam_time');
  final currTimeTimer = 0.obs;

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  RxBool get lastQuestion => (selectedQuestion.value == examData.length).obs;

  void _startTimer() {
    timerCtr.startTimer(
      updateId: 'exam',
      time: TimerHelper.startTimer(seconds: 1080),
      onChanged: (int time) {
        currTimeTimer.value = time;
        update(['count_down_timer']);
      },
    );
  }
}
