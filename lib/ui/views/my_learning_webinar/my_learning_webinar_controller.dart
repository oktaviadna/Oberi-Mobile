import 'package:get/get.dart';
import 'package:oberi_mobile/data/dummy/webinar_data.dart';

class MyLearningWebinarController extends GetxController {
  String tag = 'MyLearningWebinarController : ';

  late Map<String, dynamic> webinarArgs;
  RxBool linkSent = false.obs;
  RxBool showDetail = false.obs;

  final List<Map<String, dynamic>> otherWebinarData = webinarDummyData;

  @override
  void onInit() {
    webinarArgs = Get.arguments;
    super.onInit();
  }

  void sendLink() {
    linkSent.value = true;
  }
}