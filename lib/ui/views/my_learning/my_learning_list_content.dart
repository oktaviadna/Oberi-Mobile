import 'package:flutter/material.dart';
import 'package:oberi_mobile/ui/views/my_learning/components/bootcamp_sublist.dart';
import 'package:oberi_mobile/ui/views/my_learning/components/free_course_sublist.dart';
import 'package:oberi_mobile/ui/views/my_learning/components/premium_course_sublist.dart';
import 'package:oberi_mobile/ui/views/my_learning/components/webinar_sublist.dart';

class MyLearningListContent extends StatelessWidget {
  const MyLearningListContent({
    Key? key,
    required this.bootcampData,
    required this.webinarData,
    required this.freeCourseData,
    required this.premiumCourseData,
  }) : super(key: key);

  final List<Map<String, dynamic>> bootcampData;
  final List<Map<String, dynamic>> webinarData;
  final List<Map<String, dynamic>> freeCourseData;
  final List<Map<String, dynamic>> premiumCourseData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (bootcampData.isNotEmpty) BootcampSublist(data: bootcampData),
          const SizedBox(height: 12),
          if (webinarData.isNotEmpty) WebinarSublist(data: webinarData),
          const SizedBox(height: 12),
          if (freeCourseData.isNotEmpty)
            FreeCourseSublist(data: freeCourseData),
          const SizedBox(height: 12),
          if (premiumCourseData.isNotEmpty)
            PremiumCourseSublist(data: premiumCourseData),
        ],
      ),
    );
  }
}
