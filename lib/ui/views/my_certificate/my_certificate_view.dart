import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/my_certificate/my_certificate_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_widget_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class MyCertificateView extends GetView<MyCertificateController> {
  static const String route = '/my-certificate';

  const MyCertificateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'My Certificate'),
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: controller.certificateData.length,
        itemBuilder: (context, index) {
          final item = controller.certificateData[index];
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
                  child: Text(
                    item['title'].toString(),
                    style: AppStyle.body2,
                  ),
                ),
                const SizedBox(width: 8),
                SkyWidgetButton(
                  width: 85,
                  height: 26,
                  onPressed: item['attachments'] != null
                      ? () => controller.onDownloadFile(item['attachments'].toString())
                      : null,
                  child: Center(
                    child: Text(
                      'Download',
                      style: AppStyle.body2.copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}
