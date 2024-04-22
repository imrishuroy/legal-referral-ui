import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

class ImageUtil {
  static Future<File?> pickImage(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () => Navigator.pop(context, ImageSource.gallery),
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () => Navigator.pop(context, ImageSource.camera),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (source != null) {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile?.path != null) {
        return File(pickedFile!.path);
      }
    }
    return null;
  }

  static Future<String?> uploadFile({
    required XFile file,
    required String filename,
    required String container,
    required String fileType,
  }) async {
    try {
      String? downloadUrl;

      // Create a Reference to the file
      final ref = FirebaseStorage.instance
          .ref()
          .child(container)
          .child('/$filename.$fileType');

      AppLogger.info('file path: ${file.path}');

      final metadata = SettableMetadata(
        contentType: fileType == 'pdf' ? 'application/pdf' : 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );

      final uploadTask = await ref.putFile(File(file.path), metadata);

      if (uploadTask.state == TaskState.success) {
        downloadUrl = await uploadTask.ref.getDownloadURL();
      }
      return downloadUrl;
    } catch (error) {
      AppLogger.error('Error uploading file: $error');
      return null;
    }
  }
}
