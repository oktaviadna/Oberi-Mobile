import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/splash/splash_controller.dart';
import 'package:oberi_mobile/ui/widgets/colored_status_bar.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class SplashView extends GetView<SplashController> {
  static const String route = '/splash';

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.tag;
    return const ColoredStatusBar(
      color: Colors.white,
      brightness: Brightness.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SkyImage(src: 'assets/images/app_logo.svg'),
                      SizedBox(height: 32),
                      SkyImage(src: 'assets/images/app_name.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
