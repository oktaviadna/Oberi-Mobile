import 'package:get/get.dart';

class MainNavController extends GetxController {
  String tag = 'MainNavController : ';
  final tabIndex = RxInt(0);

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

}