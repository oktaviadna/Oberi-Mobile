import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/components/bootcamp_overview_biaya.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/components/bootcamp_overview_desc.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/components/bootcamp_overview_silabus.dart';

class BootcampOverviewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String tag = 'BootcampOverviewController : ';

  late Map<String, dynamic> args;

  late TabController tabController;
  Map<int, Widget> tabPage = {
    0: const BootcampOverviewDesc(),
    1: const BootcampOverviewSilabus(),
    2: const BootcampOverviewBiaya(),
  };

  @override
  void onInit() {
    args = Get.arguments;
    tabController = TabController(vsync: this, length: 3);
    super.onInit();
  }
}
