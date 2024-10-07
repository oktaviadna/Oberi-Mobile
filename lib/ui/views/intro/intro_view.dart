import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/ui/views/intro/intro_controller.dart';
import 'package:oberi_mobile/ui/views/login/login_view.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';
import 'package:oberi_mobile/ui/views/register/register_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class IntroView extends GetView<IntroController> {
  static const String route = '/intro';

  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SkyImage(src: 'assets/images/app_logo_name.png'),
              const SizedBox(height: 71),
              SkyButton(
                text: 'LOGIN',
                fontWeight: FontWeight.w700,
                onPressed: () {
                  Get.toNamed(LoginView.route);
                },
              ),
              const SizedBox(height: 12),
              SkyButton(
                text: 'SIGN UP',
                fontWeight: FontWeight.w700,
                outlineMode: true,
                onPressed: () {
                  Get.toNamed(RegisterView.route);
                },
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Go To '),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MainNavView.route);
                    },
                    child: const Text(
                      'HOME PAGE',
                      style: TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
