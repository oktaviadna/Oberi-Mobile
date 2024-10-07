import 'package:get/get.dart';
import 'package:oberi_mobile/data/dummy/certificate_data.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCertificateController extends GetxController {
  String tag = 'MyCertificateController : ';

  final List<Map<String, String>> certificateData = certificateDummyData;

  Future<void> onDownloadFile(String url) async {
    print('download');

    // OpenFilex.open(url);
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalNonBrowserApplication
        // mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $uri';
    }
  }
}
