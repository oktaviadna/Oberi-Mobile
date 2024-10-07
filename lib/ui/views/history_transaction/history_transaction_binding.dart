import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/history_transaction/history_transaction_controller.dart';

class HistoryTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryTransactionController());
  }
}