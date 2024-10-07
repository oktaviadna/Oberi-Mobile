import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/login_google_confirm/login_google_confirm_binding.dart';
import 'package:oberi_mobile/ui/views/login_google_confirm/login_google_confirm_view.dart';

final loginGoogleConfirmRoute = [
  GetPage(
    name: LoginGoogleConfirmView.route,
    page: () => const LoginGoogleConfirmView(),
    binding: LoginGoogleConfirmBinding(),
  ),
];
