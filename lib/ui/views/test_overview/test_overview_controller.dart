import 'package:get/get.dart';

class TestOverviewController extends GetxController {
  String tag = 'TestOverviewController : ';

  late Map<String, dynamic> chapterArgs;

  @override
  void onInit() {
    chapterArgs = Get.arguments;
    super.onInit();
  }

}