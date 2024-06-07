import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

enum FileExtension { pdf, jpg, jpeg, png }

class FilePickerUtil {
  FilePickerUtil._privateConstructor();

  static final FilePickerUtil _instance = FilePickerUtil._privateConstructor();

  static FilePickerUtil get instance {
    return _instance;
  }

  static Future<List<File>> pickMultipleFiles() async {
    try {
      final picker = ImagePicker();
      // Pick multiple images and videos.
      // final medias = await picker.pickMultipleMedia();
      final images = await picker.pickMultiImage();

      return images.map((image) => File(image.path)).toList();
    } catch (error) {
      AppLogger.info('Error: $error');
      return [];
    }
  }

  static Future<List<File?>> pickFile({
    required List<FileExtension> allowedExtensions,
  }) async {
    final filePicker = FilePicker.platform;
    final pickedFile = await filePicker.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions:
          allowedExtensions.map((e) => e.toString().split('.').last).toList(),
    );
    if (pickedFile != null && pickedFile.files.isNotEmpty) {
      return pickedFile.files.map((file) => File(file.path!)).toList();
      // return File(pickedFile.files.single.path!);
    }
    return [];
  }
}
