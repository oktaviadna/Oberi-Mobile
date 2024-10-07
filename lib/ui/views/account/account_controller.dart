import 'package:get/get.dart';
import 'package:oberi_mobile/data/local/shared_preferences.dart';
import 'package:oberi_mobile/data/local/shared_preferences_key.dart';
import 'package:oberi_mobile/ui/views/login/login_view.dart';

class AccountController extends GetxController {
  String tag = 'AccountController : ';

  void onLogout() {
    SPrefs.find.remove(SPrefsKey.token);
    Get.offAllNamed(LoginView.route);
  }
}