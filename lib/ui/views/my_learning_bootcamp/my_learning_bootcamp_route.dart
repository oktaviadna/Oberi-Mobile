import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_binding.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_view.dart';

final myLearningBootcampRoute = [
  GetPage(
    name: MyLearningBootcampView.route,
    page: () => const MyLearningBootcampView(),
    binding: MyLearningBootcampBinding(),
  ),
];
