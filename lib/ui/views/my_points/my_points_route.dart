import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/my_points/my_points_binding.dart';
import 'package:oberi_mobile/ui/views/my_points/my_points_view.dart';

final myPointsRoute = [
  GetPage(
    name: MyPointsView.route,
    page: () => const MyPointsView(),
    binding: MyPointsBinding(),
  ),
];
