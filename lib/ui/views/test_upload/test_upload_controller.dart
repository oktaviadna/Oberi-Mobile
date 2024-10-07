import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/helper/file_helper.dart';
import 'package:oberi_mobile/core/helper/sky_snackbar.dart';
import 'package:oberi_mobile/core/helper/timer_helper.dart';
import 'package:oberi_mobile/core/helper/timer_module.dart';
import 'package:oberi_mobile/core/helper/validator_helper.dart';
import 'package:oberi_mobile/data/dummy_connection.dart';
import 'package:oberi_mobile/ui/widgets/base/sky_dialog.dart' as w;
import 'package:oberi_mobile/ui/views/test_upload/components/dialog_test_upload_detail.dart';

class TestUploadController extends GetxController {
  String tag = 'TestUploadController : ';

  final timerCtr = Get.find<TimerModule>(tag: 'upload_time');
  final currTimeTimer = 'Waiting...'.obs;

  final formKey = GlobalKey<FormState>();
  final commentController = TextEditingController();
  List<File>? pickedFile;
  List<File> uploadedFile = [];

  RxInt dummyMaxUploadTime = 10.obs;

  RxBool isPausedUpload = false.obs;

  bool get isUploading =>
      currTimeTimer.value != 'Done' && currTimeTimer.value != 'Waiting...';

  bool get isSuccessUpload => currTimeTimer.value == 'Done';

  Future<void> onPickVideo() async {
    pickedFile = await FileHelper.pickFile(allowMultiple: true);
    if (pickedFile != null) {
      _startTimer();
    }
    update();
  }

  void _startTimer() {
    timerCtr.startTimer(
      updateId: 'upload',
      time: TimerHelper.startTimer(seconds: dummyMaxUploadTime.value),
      onStart: (item) {
        currTimeTimer.value = item.toString();
      },
      onChanged: (int time) {
        currTimeTimer.value = time.toString();
      },
      onFinished: () {
        currTimeTimer.value = 'Done';
        update();
      },
    );
  }

  Future<void> onSubmit() async {
    if (AppValidator.validateForm(formKey) &&
        isSuccessUpload &&
        pickedFile!.isNotEmpty) {
      await DummyConnection.show(duration: const Duration(seconds: 2));
      uploadedFile.addAll(pickedFile ?? []);
      SkySnackBar.success(
        message: 'Yeay, ${pickedFile?.length} File Berhasil terupload!',
      );
      pickedFile?.clear();
    }
    update();
  }

  Future<void> onDeleteUploadingFile(int index) async {
    pickedFile?.removeAt(index);
    update();
  }

  Future<void> onDeleteUploadedFile(int index) async {
    uploadedFile.removeAt(index);
    update();
  }

  Future<void> onCancelUpload() async {
    isPausedUpload = false.obs;
    timerCtr.stopTimer();
    pickedFile?.clear();
    update();
  }

  Future<void> onPauseResumeUpload() async {
    isPausedUpload.toggle();
    if (isPausedUpload.isTrue) {
      timerCtr.stopTimer();
    } else {
      timerCtr.resumeTimer();
    }
  }

  Future<void> onShowDetailUpload() async {
    showDialog(
      barrierDismissible: true,
      context: Get.context!,
      builder: (context) => w.SkyDialog(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: DialogTestDetailUpload(data: pickedFile),
      ),
    );
  }
}
