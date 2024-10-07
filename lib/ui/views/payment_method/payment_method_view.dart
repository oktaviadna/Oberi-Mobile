import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/payment_method/payment_method_controller.dart';
import 'package:oberi_mobile/ui/views/payment_method/widgets/payment_method_section.dart';
import 'package:oberi_mobile/ui/widgets/base/base_bottom_bar.dart';
import 'package:oberi_mobile/ui/widgets/picker/picker_data.dart';
import 'package:oberi_mobile/ui/widgets/picker/picker_listview.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class PaymentMethodView extends GetView<PaymentMethodController> {
  static const String route = '/payment-method';

  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Metode Pembayaran'),
      bottomNavigationBar: BaseBottomBar(
        child: SkyButton(
          text: 'Konfirmasi',
          onPressed: () {
            Get.back(result: controller.selectedPaymentMethod);
          },
        ),
      ),
      body: GetBuilder<PaymentMethodController>(
        builder: (controller) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          itemCount: controller.paymentMenu.length,
          itemBuilder: (_, index) {
            final item = controller.paymentMenu[index];
            RxBool showDetail = item.isSelected.obs;
            return Obx(
              () => PaymentMethodSection(
                text: item.title.toString(),
                showDetail: showDetail.isTrue,
                onTap: () {
                  showDetail.toggle();
                  item.isSelected = showDetail.value;
                },
                childExpand: PickerListView<Map<String, dynamic>>(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  data: item.paymentMethod ?? [],
                  initialValue: item.paymentMethod?.firstWhereOrNull(
                    (e) => (e.data?['name'] ==
                        controller.selectedPaymentMethod?['name']),
                  ),
                  type: ListPickerType.single,
                  onChanged: (context, index, selectedItem, selectedListItem) {
                    if (selectedItem != null) {
                      controller.resetSelectedOtherGroup(item.title);
                      controller.selectedPaymentMethod = selectedItem;
                    }
                  },
                  separator: const Divider(),
                  itemBuilder: (PickerData<Map<String, dynamic>> item) {
                    return Row(
                      children: [
                        SkyImage(
                          src: item.data?['image'],
                          width: 45,
                          height: 45,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(width: 16),
                        Text(item.data?['name'], style: AppStyle.subtitle4),
                        const Spacer(),
                        (item.isSelected)
                            ? const SkyImage(
                                src: 'assets/images/ic_radio_filled.svg',
                                width: 27,
                              )
                            : const SkyImage(
                                src: 'assets/images/ic_radio_unfilled.svg',
                                width: 24,
                              )
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
