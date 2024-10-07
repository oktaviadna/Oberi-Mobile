import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_binding.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_view.dart';

final testUploadRoute = [
  GetPage(
    name: TestUploadView.route,
    page: () => const TestUploadView(),
    binding: TestUploadBinding(),
  ),
];
