import 'package:oberi_mobile/core/helper/dialog_helper.dart';

class DummyConnection {
  static Future<void> show({Duration? duration}) async {
    LoadingDialog.show();
    await Future.delayed(duration ?? const Duration(seconds: 1));
    LoadingDialog.dismiss();
  }
}
