import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/data/dummy/my_learning/my_learning_bootcamp_data.dart';
import 'package:oberi_mobile/data/dummy/my_learning/my_learning_free_course_data.dart';
import 'package:oberi_mobile/data/dummy/my_learning/my_learning_premium_course_data.dart';
import 'package:oberi_mobile/data/dummy/my_learning/my_learning_webinar_data.dart';
import 'package:oberi_mobile/ui/views/my_learning/tabs/my_learning_berlangsung.dart';
import 'package:oberi_mobile/ui/views/my_learning/tabs/my_learning_selesai.dart';

class MyLearningController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String tag = 'MyLearningController : ';

  late TabController tabController;

  Map<int, Widget> tabPage = {
    0: const MyLearningBerlangsung(),
    1: const MyLearningSelesai(),
  };

  // RxInt index = 0.obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }

  final List<Map<String, dynamic>> bootcampData = myLearningBootcampDummyData;
  final List<Map<String, dynamic>> webinarData = myLearningWebinarDummyData;
  final List<Map<String, dynamic>> freeCourseData = myLearningFreeCourseDummyData;
  final List<Map<String, dynamic>> premiumCourseData = myLearningPremiumCourseDummyData;
}
