import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/history_transaction/history_transaction_binding.dart';
import 'package:oberi_mobile/ui/views/history_transaction/history_transaction_view.dart';

final historyTransactionRoute = [
  GetPage(
    name: HistoryTransactionTabView.route,
    page: () => const HistoryTransactionTabView(),
    binding: HistoryTransactionBinding(),
  ),
];
