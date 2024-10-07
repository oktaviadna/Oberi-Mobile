import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_controller.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_list_content.dart';

class MyLearningBerlangsung extends GetView<MyLearningController> {
  const MyLearningBerlangsung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyLearningListContent(
      bootcampData: controller.bootcampData
          .where((e) => e['status'] == 'Berlangsung')
          .toList(),
      webinarData: controller.webinarData
          .where((e) => e['status'] == 'Berlangsung')
          .toList(),
      freeCourseData: controller.freeCourseData
          .where((e) => e['status'] == 'Berlangsung')
          .toList(),
      premiumCourseData: controller.premiumCourseData
          .where((e) => e['status'] == 'Berlangsung')
          .toList(),
    );
  }
}
