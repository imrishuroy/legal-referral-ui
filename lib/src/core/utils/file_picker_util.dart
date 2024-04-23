import 'dart:io';

import 'package:file_picker/file_picker.dart';

enum FileExtension { pdf, jpg, jpeg, png }

class FilePickerUtil {
  FilePickerUtil._privateConstructor();

  static final FilePickerUtil _instance = FilePickerUtil._privateConstructor();

  static FilePickerUtil get instance {
    return _instance;
  }

  static Future<File?> pickFile({
    required List<FileExtension> allowedExtensions,
  }) async {
    final filePicker = FilePicker.platform;
    final pickedFile = await filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          allowedExtensions.map((e) => e.toString().split('.').last).toList(),
    );
    if (pickedFile != null) {
      return File(pickedFile.files.single.path!);
    }
    return null;
  }
}
