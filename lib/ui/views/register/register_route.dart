import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/register/register_binding.dart';
import 'package:oberi_mobile/ui/views/register/register_view.dart';

final registerRoute = [
  GetPage(
    name: RegisterView.route,
    page: () => const RegisterView(),
    binding: RegisterBinding(),
  ),
];
