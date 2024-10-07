import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/test_review/test_review_binding.dart';
import 'package:oberi_mobile/ui/views/test_review/test_review_view.dart';

final testReviewRoute = [
  GetPage(
    name: TestReviewView.route,
    page: () => const TestReviewView(),
    binding: TestReviewBinding(),
  ),
];
