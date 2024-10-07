import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/home/components/home_bootcamp.dart';
import 'package:oberi_mobile/ui/views/home/components/home_free_course.dart';
import 'package:oberi_mobile/ui/views/home/components/home_team_mentor.dart';
import 'package:oberi_mobile/ui/views/home/components/home_webinar.dart';

import 'components/home_header.dart';
import 'components/home_recommended.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const String route = '/home';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
              HomeRecommended(),
              HomeFreeCourse(),
              HomeWebinar(),
              HomeBootcamp(),
              HomeTeamMentor(),
            ],
          ),
        ),
      ),
    );
  }
}
