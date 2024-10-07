import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/login_google/login_google_binding.dart';
import 'package:oberi_mobile/ui/views/login_google/login_google_view.dart';

final loginGoogleRoute = [
  GetPage(
    name: LoginGoogleView.route,
    page: () => const LoginGoogleView(),
    binding: LoginGoogleBinding(),
  ),
];
