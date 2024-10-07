import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/extensions/int_extension.dart';
import 'package:oberi_mobile/core/helper/validator_helper.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_checkout/bootcamp_checkout_controller.dart';
import 'package:oberi_mobile/ui/widgets/keyboard_dismisser.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_form_field.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class BootcampCheckoutView extends GetView<BootcampCheckoutController> {
  static const String route = '/bootcamp-checkout';

  const BootcampCheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Informasi Pendaftaran'),
      body: KeyboardDismisser(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Peserta',
                  style: AppStyle.subtitle2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nama Peserta',
                  style: AppStyle.body1,
                ),
                const SizedBox(height: 8),
                SkyFormField(
                  hint: 'masukkan nama kamu',
                  controller: controller.nameController,
                  style: AppStyle.body2,
                  keyboardType: TextInputType.text,
                  validator: (value) => AppValidator.generalField(
                    value.toString(),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Telepon',
                  style: AppStyle.body1,
                ),
                const SizedBox(height: 8),
                SkyFormField(
                  hint: 'masukkan no telepon',
                  controller: controller.phoneController,
                  style: AppStyle.body2,
                  keyboardType: TextInputType.phone,
                  validator: (value) => AppValidator.field(
                    title: 'Email',
                    value: value.toString(),
                    regex: AppRegex.phone,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Email',
                  style: AppStyle.body1,
                ),
                const SizedBox(height: 8),
                SkyFormField(
                  hint: 'masukkan email kamu',
                  controller: controller.emailController,
                  style: AppStyle.body2,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => AppValidator.field(
                    title: 'Email',
                    value: value.toString(),
                    regex: AppRegex.email,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Jenis Pembayaran',
                  style: AppStyle.subtitle2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 21),
                Row(
                  children: [
                    SkyImage(
                      src: controller.args['banner'],
                      height: 65,
                      width: 137,
                      fit: BoxFit.fitWidth,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.args['title'],
                            style: AppStyle.subtitle4
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            controller.args['detail'],
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: AppStyle.body2
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'Metode Pembayaran',
                  style: AppStyle.subtitle2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                GetBuilder<BootcampCheckoutController>(
                  builder: (controller) => (controller.paymentMethod == null)
                      ? InkWell(
                          onTap: () {
                            controller.selectPaymentMethod();
                          },
                          child: SkyFormField(
                            hint: 'Pilih Metode Pembayaran',
                            endIcon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                            ),
                            enabled: false,
                            hintStyle: AppStyle.subtitle4.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            controller.selectPaymentMethod();
                          },
                          child: SkyFormField(
                            prefixWidget: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SkyImage(
                                src: controller.paymentMethod?['image'],
                                width: 45,
                                height: 45,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            hint: controller.paymentMethod?['name'],
                            endIcon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                            ),
                            enabled: false,
                            hintStyle: AppStyle.subtitle4.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Ringkasan',
                  style: AppStyle.subtitle2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Oberi Bootcamp',
                      style: AppStyle.subtitle4.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      (controller.args['price'] as int)
                          .currencyFormat(symbol: 'Rp. '),
                      style: AppStyle.subtitle4.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: AppStyle.subtitle3.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      (controller.args['price'] as int)
                          .currencyFormat(symbol: 'Rp. '),
                      style: AppStyle.subtitle3.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 93),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.acceptSK.value,
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        onChanged: (value) {
                          controller.acceptSK.toggle();
                        },
                      ),
                    ),
                    RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: AppStyle.body2.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Saya setuju dengan ',
                            style: AppStyle.body2,
                          ),
                          TextSpan(
                            text: 'syarat dan ketentuan',
                            style: AppStyle.body2.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' ini',
                            style: AppStyle.body2.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SkyButton(
                  text: 'Bayar',
                  onPressed: () {
                    controller.onCheckout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
