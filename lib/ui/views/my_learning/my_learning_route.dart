import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_binding.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_view.dart';

final myLearningRoute = [
  GetPage(
    name: MyLearningView.route,
    page: () => const MyLearningView(),
    binding: MyLearningBinding(),
  ),
];
