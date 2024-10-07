import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/history_transaction/components/history_transaction_list.dart';
import 'package:oberi_mobile/ui/views/history_transaction/history_transaction_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';

class HistoryTransactionTabView extends GetView<HistoryTransactionController> {
  static const String route = '/history-transaction';

  const HistoryTransactionTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SkyAppBar.primary(title: 'Riwayat Transaksi'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
              width: Get.size.width - 40,
              child: TabBar(
                controller: controller.tabController,
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                labelStyle: AppStyle.subtitle3,
                labelPadding: const EdgeInsets.symmetric(horizontal: 24),
                tabs: const [
                  Tab(text: 'Berlangsung'),
                  Tab(text: 'Selesai'),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight * 2 -
                  Get.statusBarHeight,
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  HistoryBerlangsung(
                    data: controller.transactionData
                        .where((e) => e['status'] == 'Menunggu Pembayaran')
                        .toList(),
                  ),
                  HistoryBerlangsung(
                    data: controller.transactionData
                        .where((e) => e['status'] != 'Menunggu Pembayaran')
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
