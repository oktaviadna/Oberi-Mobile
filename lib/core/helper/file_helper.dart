import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:oberi_mobile/core/helper/sky_snackbar.dart';

class FileHelper {
  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "Kb", "Mb", "Gb", "Tb"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static String getFileSizeStringFromPath(String path, {int decimals = 0}) {
    int bytes = File(path).lengthSync();
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  static Future<List<File>?> pickFile({
    List<String>? allowedExtensions,
    bool allowMultiple = false,
  }) async {
    List<String> extensions = allowedExtensions ?? _defaultExtensions;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
      allowMultiple: allowMultiple,
    );

    List<File>? data =
        result?.files.map((e) => File(e.path.toString())).toList();

    if (result != null) {
      /// Verify Extension
      /// Handle beberapa device android yang tidak support filter extension
      ///
      for (int i = 0; i < (result.paths.length); i++) {
        bool isMatches = false;
        for (String allowedExtension in extensions) {
          if (result.paths[i]!.endsWith(allowedExtension)) {
            isMatches = true;
          }
        }
        if (isMatches == false) {
          data?.removeAt(i);
          SkySnackBar.error(message: 'Extension not allowed');
        }
      }
    }

    return data;
  }

  static List<String> get _defaultExtensions => [
        'pdf',
        'png',
        'jpeg',
        'jpg',
        'docx',
        'doc',
        'ppt',
        'pptx',
        'xls',
        'xlsx',
        'mp4',
        'mkv',
        'mov',
      ];
}
