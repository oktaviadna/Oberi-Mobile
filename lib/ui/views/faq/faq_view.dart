import 'package:collection_picker/collection_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/ui/views/faq/faq_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

class FaqView extends GetView<FaqController> {
  static const String route = '/faq';

  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SkyAppBar.primary(title: 'FAQ'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.chat_bubble_outline,
          color: Colors.white,
        ),
      ),
      body: ListViewPicker(
        type: PickerType.single,
        data: controller.faqData,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        separator: const SizedBox(height: 8),
        onChanged: (context, index, selectedItem, selectedListItem) {},
        itemBuilder: (context, index, PickerWrapper<dynamic> item) {
          return Column(
            children: [
              SkyBox(
                borderRadius: 8,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  children: [
                    Expanded(child: Text(item.data['question'])),
                    Icon((item.isSelected)
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              if (item.isSelected)
                ...[
                  SkyBox(
                    elevation: 0,
                    child: Text(item.data['answer']),
                  ),
                  const SizedBox(height: 8),
                ]
            ],
          );
        },
      ),
    );
  }
}
