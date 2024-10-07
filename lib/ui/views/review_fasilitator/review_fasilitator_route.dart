import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/review_fasilitator/review_fasilitator_binding.dart';
import 'package:oberi_mobile/ui/views/review_fasilitator/review_fasilitator_view.dart';

final reviewFasilitatorRoute = [
  GetPage(
    name: ReviewFasilitatorView.route,
    page: () => const ReviewFasilitatorView(),
    binding: ReviewFasilitatorBinding(),
  ),
];
