import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/redeem_point/redeem_point_binding.dart';
import 'package:oberi_mobile/ui/views/redeem_point/redeem_point_view.dart';

final redeemPointRoute = [
  GetPage(
    name: RedeemPointView.route,
    page: () => const RedeemPointView(),
    binding: RedeemPointBinding(),
  ),
];
