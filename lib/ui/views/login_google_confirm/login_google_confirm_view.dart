import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/data/dummy_connection.dart';
import 'package:oberi_mobile/ui/views/login_google_confirm/login_google_confirm_controller.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class LoginGoogleConfirmView extends GetView<LoginGoogleConfirmController> {
  static const String route = '/login-google-confirm';

  const LoginGoogleConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SkyBox(
                elevation: 0,
                margin: EdgeInsets.zero,
                borderRadius: 0,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    SkyImage(
                      src: 'assets/images/google.png',
                      height: 32,
                      width: 32,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Login with Google',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const Text(
                      'Confirm you want to sign in to Oberi App as User',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 46),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SkyImage(
                          height: 36,
                          width: 36,
                          borderRadius: BorderRadius.circular(24),
                          src: 'https://i.pravatar.cc/300?u=a042581f4e2',
                        ),
                        const SizedBox(width: 14),
                        Text(
                          'keira@gmail.com',
                          style: AppStyle.body2.copyWith(
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 46),
                    Text(
                      'To create your account, Google will share your name, email address, and profile picture with “Oberi App”. See “OberiApp”’s privacy policy and terms of service.',
                      textAlign: TextAlign.center,
                      style: AppStyle.body2.copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 36),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          SkyButton(
                            wrapContent: true,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            color: Colors.blue,
                            text: 'Confirm',
                            onPressed: () async {
                              await DummyConnection.show();
                              Get.toNamed(MainNavView.route);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
