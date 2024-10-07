import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/test_overview/test_overview_controller.dart';
import 'package:oberi_mobile/ui/views/test_question/test_question_view.dart';
import 'package:oberi_mobile/ui/widgets/info_table.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class TestOverviewView extends GetView<TestOverviewController> {
  static const String route = '/test-overview';

  const TestOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Post Test'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SkyImage(
                src: 'assets/images/img_exam.png',
              ),
              SkyBox(
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Post Test',
                      style: AppStyle.subtitle3.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      controller.chapterArgs['description'],
                      style: AppStyle.subtitle4.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      controller.chapterArgs['title'],
                      style: AppStyle.body2,
                    ),
                    const SizedBox(height: 12),
                    InfoTable(
                      cellTextAlign: TextAlign.left,
                      separatorEnabled: false,
                      cellPadding: const EdgeInsets.fromLTRB(0, 4, 12, 4),
                      headerTextStyle:
                          AppStyle.body2.copyWith(fontWeight: FontWeight.w500),
                      data: const {
                        'Tipe Soal': 'Pilihan Ganda',
                        'Jumlah Soal': '20 Pertanyaan',
                        'Durasi': '20 Menit',
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tes ini hanya untuk mengetahui tentang pemahamanmu tentang materi ini',
                      style: AppStyle.body2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              SkyButton(
                text: 'Mulai Mengerjakan',
                onPressed: () {
                  Get.toNamed(TestQuestionView.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
