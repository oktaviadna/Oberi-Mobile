import 'package:get/get.dart';

class PaymentSuccessController extends GetxController {
  String tag = 'PaymentSuccessController : ';
  late Map<String, dynamic> args;

  @override
  void onInit() {
    args = Get.arguments;
    super.onInit();
  }

}