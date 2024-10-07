import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/faq/faq_binding.dart';
import 'package:oberi_mobile/ui/views/faq/faq_view.dart';

final faqRoute = [
  GetPage(
    name: FaqView.route,
    page: () => const FaqView(),
    binding: FaqBinding(),
  ),
];
