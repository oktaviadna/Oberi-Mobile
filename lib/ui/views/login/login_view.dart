import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/validator_helper.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/login_google/login_google_view.dart';
import 'package:oberi_mobile/ui/views/register/register_view.dart';
import 'package:oberi_mobile/ui/widgets/colored_status_bar.dart';
import 'package:oberi_mobile/ui/widgets/keyboard_dismisser.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_form_field.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  static const String route = '/login';

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: Colors.white,
      child: KeyboardDismisser(
        child: SafeArea(
          child: Scaffold(
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => controller.bypassLogin(),
                        child: const Text(
                          'Lewati',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SkyImage(
                      src: 'assets/images/app_logo_name.png',
                      height: 160,
                      width: 126,
                    ),
                    const SizedBox(height: 34),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login',
                        style: AppStyle.headline3.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Email',
                            style: AppStyle.body2,
                          ),
                          const SizedBox(height: 8),
                          SkyFormField(
                            hint: 'masukkan email kamu',
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => AppValidator.field(
                              title: 'Email',
                              value: value.toString(),
                              regex: AppRegex.email,
                            ),
                            endIcon: const Icon(
                              Icons.person_outline,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Password',
                            style: AppStyle.body2,
                          ),
                          const SizedBox(height: 8),
                          Obx(
                            () => SkyPasswordFormField(
                              hint: 'masukkan password',
                              controller: controller.passController,
                              hiddenText: controller.isHiddenPassword.value,
                              endIcon: IconButton(
                                  icon: (controller.isHiddenPassword.isTrue)
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: AppColors.primary,
                                        )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          color: AppColors.primary,
                                        ),
                                  onPressed: () => controller.hidePassword()),
                              validator: (value) => AppValidator.field(
                                title: 'Password',
                                value: value.toString(),
                                regex: AppRegex.password,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '*min. 8 character',
                            textAlign: TextAlign.left,
                            style: AppStyle.body2.copyWith(color: Colors.black54),
                          ),
                          const SizedBox(height: 12),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Lupa password ?',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SkyButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.login();
                            },
                            text: 'LOGIN',
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 8),
                          SkyButton(
                            outlineMode: true,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Get.toNamed(LoginGoogleView.route);
                            },
                            text: 'Continue with Account Google',
                            iconWidget:
                                const SkyImage(src: 'assets/images/google.png'),
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Belum punya akun ? '),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(RegisterView.route);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
