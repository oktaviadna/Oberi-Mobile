import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_question/test_question_binding.dart';
import 'package:oberi_mobile/ui/views/test_question/test_question_view.dart';

final testQuestionRoute = [
  GetPage(
    name: TestQuestionView.route,
    page: () => const TestQuestionView(),
    binding: TestQuestionBinding(),
  ),
];
