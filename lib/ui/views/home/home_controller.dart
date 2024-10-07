import 'package:get/get.dart';
import 'package:oberi_mobile/data/dummy/free_course_data.dart';
import 'package:oberi_mobile/data/dummy/mentor_data.dart';
import 'package:oberi_mobile/data/dummy/recommendation_data.dart';
import 'package:oberi_mobile/data/dummy/webinar_data.dart';

class HomeController extends GetxController {

  final filter = [
    'Semua',
    'Webinar',
    'Bootcamp',
    'Free Course',
    'Pro Class'
  ];

  final List<Map<String, dynamic>> recommendedData = recommendationDummyData;
  final List<Map<String, dynamic>> freeForYouData = freeCourseDummyData;
  final List<Map<String, dynamic>> webinarData = webinarDummyData;
  final List<Map<String, dynamic>> mentorData = mentorDummyData;
}