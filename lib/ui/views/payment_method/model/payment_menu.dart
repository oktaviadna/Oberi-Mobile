import 'package:oberi_mobile/ui/widgets/picker/picker_data.dart';

class PaymentMenu {
  String? title;
  bool isSelected;
  List<PickerData<Map<String, dynamic>>>? paymentMethod;

  PaymentMenu({
    this.title,
    this.isSelected = false,
    this.paymentMethod,
  });

  @override
  String toString() {
    return '${paymentMethod?.map((e) => e.isSelected)}';
  }
}