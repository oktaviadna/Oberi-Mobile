import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/sky_snackbar.dart';

class RedeemPointController extends GetxController {
  String tag = 'RedeemPointController : ';

  List<Map<String, dynamic>> rewardData = [];

  RxInt totalPoint = 0.obs;

  @override
  void onInit() {
    totalPoint.value = Get.arguments['total_point'];
    rewardData = Get.arguments['reward_data'];
    super.onInit();
  }

  void onRedeemReward(Map<String, dynamic> item) {
    if (totalPoint.value < item['point']) {
      SkySnackBar.error(message: 'Not enough point');
    } else {
      totalPoint.value = totalPoint.value - item['point'] as int;
      item['status'] = 'Redeemed';
      update();
    }
  }
}