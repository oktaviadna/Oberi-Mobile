import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/login/login_binding.dart';
import 'package:oberi_mobile/ui/views/login/login_view.dart';

final loginRoute = [
  GetPage(
    name: LoginView.route,
    page: () => const LoginView(),
    binding: LoginBinding(),
  ),
];
