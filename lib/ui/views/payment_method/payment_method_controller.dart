import 'package:get/get.dart';
import 'package:oberi_mobile/data/dummy/payment_method_data.dart';
import 'package:oberi_mobile/ui/widgets/picker/picker_data.dart';

import 'model/payment_menu.dart';

class PaymentMethodController extends GetxController {
  String tag = 'PaymentMethodController : ';

  final List<Map<String, dynamic>> paymentMethodData = paymentMethodDummyData;
  List<PaymentMenu> paymentMenu = [];

  Map<String, dynamic>? selectedPaymentMethod;

  @override
  void onInit() {
    setPaymentGroup();
    super.onInit();
  }

  void setPaymentGroup() {
    for (var element in paymentMethodData) {
      paymentMenu.add(
        PaymentMenu(
          title: element['type'],
          paymentMethod: (element['payment_method'] as List)
              .map((e) => PickerData<Map<String, dynamic>>(data: e))
              .toList(),
        ),
      );
    }
  }

  void resetSelectedOtherGroup(String? group) {
    for (var i in paymentMenu) {
      if (i.title != group) {
        i.paymentMethod?.forEach((element) {
          element.isSelected = false;
        });
      }
    }
    update();
  }
}
