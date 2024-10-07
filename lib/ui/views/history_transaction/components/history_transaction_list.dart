import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/history_transaction/components/transaction_status.dart';
import 'package:oberi_mobile/ui/views/history_transaction/history_transaction_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class HistoryBerlangsung extends GetView<HistoryTransactionController> {
  const HistoryBerlangsung({Key? key, required this.data}) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        final item = data[index];
        return SkyBox(
          elevation: 0,
          child: Row(
            children: [
              SkyImage(
                src: item['image'],
                height: 66,
                width: 66,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'].toString(),
                      style: AppStyle.body2,
                    ),
                    TransactionStatus.getHistoryStatus(
                      item['status'],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        );
      },
    );
  }
}
