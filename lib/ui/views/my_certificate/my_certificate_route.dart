import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_certificate/my_certificate_binding.dart';
import 'package:oberi_mobile/ui/views/my_certificate/my_certificate_view.dart';

final myCertificateRoute = [
  GetPage(
    name: MyCertificateView.route,
    page: () => const MyCertificateView(),
    binding: MyCertificateBinding(),
  ),
];
