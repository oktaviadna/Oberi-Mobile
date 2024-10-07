import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_learning_webinar/my_learning_webinar_binding.dart';
import 'package:oberi_mobile/ui/views/my_learning_webinar/my_learning_webinar_view.dart';

final myLearningWebinarRoute = [
  GetPage(
    name: MyLearningWebinarView.route,
    page: () => const MyLearningWebinarView(),
    binding: MyLearningWebinarBinding(),
  ),
];
