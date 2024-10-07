import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ChatAttachmentController extends GetxController {
  List<File> files = [];

  FileType? fileType;
  List<String>? allowedExtensions;
  bool? allowMultiple;

  ChatAttachmentController({
    FileType? givenFileType,
    List<String>? givenAllowedExtensions,
    bool? givenAllowMultiple,
  }) {
    fileType = givenFileType;
    allowedExtensions = givenAllowedExtensions;
    allowMultiple = givenAllowMultiple;
    update();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await _getFilePickerResult();
    if (result == null) return;

    List<PlatformFile> resultFiles = result.files;
    int filesCount = resultFiles.length;

    for (var i = 0; i < filesCount; i++) {
      files.add(File(resultFiles[i].path.toString()));
    }
    update();
  }

  List<String> getFilesPath() {
    List<String> result = [];
    int filesLength = files.length;

    for (var i = 0; i < filesLength; i++) {
      result.add(files[i].path);
    }

    return result;
  }

  void deleteFileByIndex(int index) {
    files.removeAt(index);
    update();
  }

  void deleteFiles() {
    files = [];
    update();
  }

  Future<FilePickerResult?> _getFilePickerResult() async {
    return await FilePicker.platform.pickFiles(
      type: fileType ?? FileType.any,
      allowedExtensions: allowedExtensions,
      allowMultiple: allowMultiple ?? true,
    );
  }
}
