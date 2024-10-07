import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/course_video/course_video_controller.dart';

class CourseVideoView extends GetView<CourseVideoController> {
  static const String route = '/course-video';
  const CourseVideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CourseVideo View'),
      ),
    );
  }
}
