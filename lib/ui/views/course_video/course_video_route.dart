import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/course_video/course_video_binding.dart';
import 'package:oberi_mobile/ui/views/course_video/course_video_view.dart';

final courseVideoRoute = [
  GetPage(
    name: CourseVideoView.route,
    page: () => const CourseVideoView(),
    binding: CourseVideoBinding(),
  ),
];
