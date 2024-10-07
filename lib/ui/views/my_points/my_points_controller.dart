import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/sky_snackbar.dart';
import 'package:oberi_mobile/data/dummy/attandance_dummy_data.dart';
import 'package:oberi_mobile/data/dummy/mission_data.dart';
import 'package:oberi_mobile/data/dummy/reward_data.dart';

class MyPointsController extends GetxController {
  String tag = 'MyPointsController : ';

  final List<Map<String, dynamic>> missionData = missionDummyData;
  List<Map<String, dynamic>> rewardData = rewardDummyData;
  final List<Map<String, dynamic>> attandanceData = attandanceDummyData;

  RxBool hasCheck = false.obs;
  RxInt totalPoint = 2500.obs;

  void onCheckIn() {
    hasCheck.value = true;
    attandanceData[2]['status'] = 'check';
    totalPoint.value += attandanceData[2]['point'] as int;
    update();
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
