import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_result/test_result_binding.dart';
import 'package:oberi_mobile/ui/views/test_result/test_result_view.dart';

final testResultRoute = [
  GetPage(
    name: TestResultView.route,
    page: () => const TestResultView(),
    binding: TestResultBinding(),
  ),
];
