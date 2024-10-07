import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/login_google/login_google_controller.dart';
import 'package:oberi_mobile/ui/views/login_google_confirm/login_google_confirm_view.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class LoginGoogleView extends GetView<LoginGoogleController> {
  static const String route = '/login-google';

  const LoginGoogleView({Key? key}) : super(key: key);

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
              const SizedBox(height: 120),
              SkyBox(
                width: Get.width,
                borderRadius: 0,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Choose an Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'to continue to “Oberi App”',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 36),
                    _buildAccount('Keyla', 'keyla@gmail.com'),
                    const Divider(height: 0,),
                    _buildAccount('Putri', 'putri@gmail.com'),
                    const Divider(height: 0,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const SkyImage(
                              src: 'assets/images/ic_account_circle.svg'),
                          const SizedBox(width: 16),
                          Text(
                            'Use another account',
                            style: AppStyle.subtitle4,
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
              const SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Text('English'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  SizedBox(width: Get.width / 8),
                  const Text('Help', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: Get.width / 20),
                  const Text('Privacy', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: Get.width / 20),
                  const Text('Terms', style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccount(String name, String email) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundImage:
            NetworkImage('https://i.pravatar.cc/300?u=a042581f4e2'),
      ),
      title: Text(
        name,
        style: AppStyle.subtitle4,
      ),
      subtitle: Text(
        email,
        style: AppStyle.body2,
      ),
      onTap: () {
        Get.toNamed(LoginGoogleConfirmView.route);
      },
    );
  }
}
