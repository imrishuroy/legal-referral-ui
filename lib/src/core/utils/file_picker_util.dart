import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

enum FileExtension { pdf, jpg, jpeg, png }

class FilePickerUtil {
  FilePickerUtil._privateConstructor();

  static final FilePickerUtil _instance = FilePickerUtil._privateConstructor();

  static FilePickerUtil get instance {
    return _instance;
  }

  static Future<File?> pickDocument() async {
    final params = FlutterDocumentPickerParams(
      // allowedFileExtensions: ['txt', 'doc', 'docx', 'pdf'],
      allowedFileExtensions: ['pdf'],

      allowedMimeTypes: ['application/*'],
      invalidFileNameSymbols: ['/'],
    );
    final path = await FlutterDocumentPicker.openDocument(params: params);
    if (path != null) {
      return File(path);
    }
    return null;
  }

  static Future<List<File>> pickImages() async {
    final filePicker = FilePicker.platform;
    final pickedFile = await filePicker.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (pickedFile != null && pickedFile.files.isNotEmpty) {
      return pickedFile.files
          .where((file) => file.path != null)
          .map((file) => File(file.path!))
          .toList();
    }
    return [];
  }

  static Future<File?> pickVideo() async {
    final filePicker = FilePicker.platform;
    final pickedFile = await filePicker.pickFiles(
      type: FileType.video,
    );

    if (pickedFile != null && pickedFile.files.isNotEmpty) {
      if (pickedFile.files.first.path != null) {
        return File(pickedFile.files.first.path!);
      }
    }
    return null;
  }

  static Future<File?> pickPdf() async {
    final filePicker = FilePicker.platform;
    final pickedFile = await filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null && pickedFile.files.isNotEmpty) {
      if (pickedFile.files.first.path != null) {
        return File(pickedFile.files.first.path!);
      }
    }
    return null;
  }

  static Future<List<File>> pickFiles({
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
    }
    return [];
  }
}
