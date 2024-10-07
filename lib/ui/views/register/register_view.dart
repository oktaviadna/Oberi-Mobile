import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/validator_helper.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/login/login_view.dart';
import 'package:oberi_mobile/ui/views/register/register_controller.dart';
import 'package:oberi_mobile/ui/widgets/colored_status_bar.dart';
import 'package:oberi_mobile/ui/widgets/keyboard_dismisser.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_form_field.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class RegisterView extends GetView<RegisterController> {
  static const String route = '/register';

  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: Colors.white,
      child: KeyboardDismisser(
        child: SafeArea(
          bottom: false,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SkyImage(
                          src: 'assets/images/app_logo.svg',
                          height: 80,
                        ),
                        SizedBox(width: 12),
                        SkyImage(
                          src: 'assets/images/app_name.svg',
                          width: 80,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign Up',
                        style: AppStyle.headline3.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: AppStyle.body2,
                          ),
                          const SizedBox(height: 8),
                          SkyFormField(
                            hint: 'masukkan nama kamu',
                            controller: controller.nameController,
                            keyboardType: TextInputType.text,
                            validator: (value) => AppValidator.generalField(
                              value.toString(),
                            ),
                          ),
                          const SizedBox(height: 12),
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
                          Text('Password', style: AppStyle.body2),
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
                          Text('Konfirmasi Password', style: AppStyle.body2),
                          const SizedBox(height: 8),
                          Obx(
                            () => SkyPasswordFormField(
                              hint: 'masukkan password',
                              controller: controller.confirmPassController,
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
                              validator: (value) => AppValidator.sameValue(
                                value: value.toString(),
                                sameAs: controller.passController.text,
                                errMessage: 'Konfirmasi Password harus sama!',
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SkyButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.signUp();
                            },
                            text: 'SIGN UP',
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 8),
                          SkyButton(
                            outlineMode: true,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
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
                              const Text('Sudah punya akun ? '),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(LoginView.route);
                                },
                                child: const Text(
                                  'Login',
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
