import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/data/dummy/transaction_history_data.dart';

class HistoryTransactionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String tag = 'HistoryTransactionController : ';

  late TabController tabController;
  final List<Map<String, dynamic>> transactionData =
      transactionHistoryDummyData;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}
