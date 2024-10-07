import 'package:get/get.dart';

class BootcampDetailController extends GetxController {
  String tag = 'BootcampDetailController : ';

  late Map<String, dynamic> args;
  late List<Map<String, dynamic>> freeCourseData;

  @override
  void onInit() {
    args = Get.arguments['data'];
    freeCourseData = (args['silabus'] as List)
        .where((e) => e['level'] == 'Free Course')
        .first['course'];
    super.onInit();
  }
}
