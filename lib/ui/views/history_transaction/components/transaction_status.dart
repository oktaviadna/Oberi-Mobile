import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

class TransactionStatus {
  static Widget getHistoryStatus(String status) {
    Map<String, Widget> widget = {
      'Menunggu Pembayaran': statusWidget(
        status,
        const Color(0xffEB9525),
        const Color(0xffEECEB0),
        const Color(0xffFFF9F2),
      ),
      'Sukses': statusWidget(
        status,
        const Color(0xff008000),
        const Color(0xffB8DBCA),
        const Color(0xffF5F5FF),
      ),
      'Gagal': statusWidget(
        status,
        const Color(0xffE33131),
        const Color(0xffEEB4B0),
        const Color(0xffFFF4F2),
      ),
    };
    return widget[status] ?? const SizedBox();
  }

  static Widget statusWidget(
    String status,
    Color textColor,
    Color borderColor,
    Color bgColor,
  ) {
    return SkyBox(
      elevation: 0,
      borderRadius: 6,
      borderColor: borderColor,
      color: bgColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: Text(
        status,
        style: AppStyle.body3.copyWith(color: textColor),
      ),
    );
  }
}
