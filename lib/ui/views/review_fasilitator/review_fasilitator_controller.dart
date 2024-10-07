import 'package:get/get.dart';

class ReviewFasilitatorController extends GetxController {
  String tag = 'ReviewFasilitatorController : ';

  late Map<String, dynamic> bootcampArgs;
  RxBool isShowBanner = true.obs;
  RxBool isShowDetailRating = false.obs;

  @override
  void onInit() {
    bootcampArgs = Get.arguments;
    super.onInit();
  }

}